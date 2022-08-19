import 'package:todos_data_source/todos_data_source.dart';

abstract class TodoDatasource {
  ///
  Future<Todo> create(Todo todo);

  ///
  Future<List<Todo>> readAll();

  ///
  Future<Todo?> read(String id);

  ///
  Future<Todo> update(
    String id,
    Todo todo,
  );

  ///
  Future<void> delete(String id);
}
