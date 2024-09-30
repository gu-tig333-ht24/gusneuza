import 'package:mocktail/mocktail.dart';
import 'package:uuid/uuid.dart';

import 'package:template/src/core/interfaces/todo_repository.dart';
import 'package:template/src/core/models/todo.dart';

class MockTodoRepository extends Mock implements TodoRepository {
  final _uuid = const Uuid();
  final List<Todo> _todos = [];

  @override
  Future<List<Todo>> createTodo(String title) {
    final todo = Todo(id: _uuid.v4(), title: title);
    _todos.add(todo);
    return Future.value(_todos);
  }

  @override
  Future<List<Todo>> fetchTodos() {
    return Future.value(_todos);
  }

  @override
  Future<bool> updateTodo(Todo todo) {
    int index = _todos.indexWhere((t) => t.id == todo.id);
    if (index != -1) {
      _todos[index] = todo.copyWith(done: !todo.done);
      return Future.value(true);
    }

    return Future.value(false);
  }

  @override
  Future<bool> removeTodo(Todo todo) {
    return Future.value(_todos.remove(todo));
  }
}
