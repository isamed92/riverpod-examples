import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';

import '../../providers/providers.dart';

class TodosScreen extends ConsumerWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de invitados'),
      ),
      body: const _TodosView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref
              .read(todosProvider.notifier)
              .addTodo(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}

class _TodosView extends ConsumerWidget {
  const _TodosView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return SwitchListTile(
            subtitle:
                Text('${todo.id} ### ${todo.completedAt?.toIso8601String()}'),
            title: Text(
              todo.description,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            value: todo.done, // True o False
            onChanged: (value) {
              ref.read(todosProvider.notifier).toggleTodo(todo.id);
            });
      },
    );
  }
}
