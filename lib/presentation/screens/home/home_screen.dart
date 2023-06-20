import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('RiverApp')),
        body: const _HomeScreenView());
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _CustomListTile(
            title: 'State Provider',
            subtitle: 'estado simple',
            location: '/state'),
        _CustomListTile(
            title: 'Future Provider',
            subtitle: 'un simple future + family',
            location: '/future'),
        _CustomListTile(
            title: 'Stream Provider',
            subtitle: 'un simple stream + family',
            location: '/stream'),
        _CustomListTile(
            title: 'State Notifier Provider',
            subtitle: 'un provider con estado personalizado',
            location: '/state-notifier'),
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String location;
  const _CustomListTile(
      {required this.title, required this.subtitle, required this.location});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        context.push(location);
      },
    );
  }
}
