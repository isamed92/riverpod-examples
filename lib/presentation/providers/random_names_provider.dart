import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';

final namesStreamProvider = StreamProvider.autoDispose<String>((ref) async* {
  await for (final randomName in RandomGenerator.randomNamesStream()) {
    yield randomName;
  }
});

// final namesStreamProvider = StreamProvider<List<String>>((ref) async* {
//   await Future.delayed(const Duration(seconds: 2));
//   yield [];
//   await Future.delayed(const Duration(seconds: 2));
//   yield ['Alice', 'Bob', 'Charlie'];
//   await Future.delayed(const Duration(seconds: 2));
//   yield ['Alice', 'Bob', 'Charlie', 'David', 'Eve'];
//   await Future.delayed(const Duration(seconds: 2));
//   yield ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Fred', 'Ginny'];
// });
