// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:in_memory_todos_data_source/in_memory_todos_data_source.dart';

void main() {
  group('InMemoryTodosDataSource', () {
    test('can be instantiated', () {
      expect(InMemoryTodosDataSource(), isNotNull);
    });
  });
}
