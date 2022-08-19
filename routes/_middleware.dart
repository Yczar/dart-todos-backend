import 'package:dart_frog/dart_frog.dart';
import 'package:in_memory_todos_data_source/in_memory_todos_data_source.dart';
import 'package:todos_data_source/todos_data_source.dart';

final _datasource = InMemoryTodosDataSource();

Handler middleware(Handler handler) {
  return handler.use(provider<TodoDatasource>((_) => _datasource));
}
