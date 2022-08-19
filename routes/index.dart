import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:todos_data_source/todos_data_source.dart';

FutureOr<Response> onRequest(RequestContext context) {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);
    case HttpMethod.delete:

    case HttpMethod.patch:
    case HttpMethod.post:
      return _post(context);
    case HttpMethod.put:
    case HttpMethod.options:
    case HttpMethod.head:
  }
  return Response();
}

Future<Response> _get(RequestContext context) async {
  final datasource = context.read<TodoDatasource>();
  final todos = await datasource.readAll();
  return Response.json(
    body: todos,
  );
}

Future<Response> _post(RequestContext context) async {
  final datasource = context.read<TodoDatasource>();
  final todo = Todo.fromMap(await context.request.json());
  return Response.json(
    statusCode: HttpStatus.created,
    body: await datasource.create(todo),
  );
}
