// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:todos_data_source/todos_data_source.dart';
import 'package:uuid/uuid.dart';

/// {@template in_memory_todos_data_source}
/// An in-memory implementation of the TodosDataSource interface.
/// {@endtemplate}
class InMemoryTodosDataSource implements TodoDatasource {
  final _cache = <String, Todo>{};

  @override
  Future<Todo> create(Todo todo) async {
    final id = const Uuid().v4();
    final createdTodo = todo.copyWith(id: id);
    _cache[id] = createdTodo;
    return createdTodo;
  }

  @override
  Future<void> delete(String id) async => _cache.remove(id);

  @override
  Future<Todo?> read(String id) async => _cache[id];

  @override
  Future<List<Todo>> readAll() async => _cache.values.toList();

  @override
  Future<Todo> update(String id, Todo todo) async =>
      _cache.update(id, (value) => todo);
}
