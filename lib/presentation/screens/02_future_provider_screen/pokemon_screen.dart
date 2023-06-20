import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class PokemonScreen extends ConsumerWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonId = ref.watch(pokemonIdProvider);
    // final pokemonAsync = ref.watch(pokemonProvider(pokemonId));
    final pokemonAsync = ref.watch(pokemonProvider);
    return Scaffold(
      appBar: AppBar(title: Text('PokemonId: $pokemonId')),
      body: Center(
        child: pokemonAsync.when(
          loading: () => const CircularProgressIndicator(),
          data: (String data) {
            return Text(data);
          },
          error: (Object error, StackTrace stackTrace) {
            return Text('Error: $error');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((id) => id + 1);
            },
            child: const Icon(Icons.plus_one),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).update((id) => id - 1);
            },
            child: const Icon(Icons.exposure_minus_1_outlined),
          ),
        ],
      ),
    );
  }
}
