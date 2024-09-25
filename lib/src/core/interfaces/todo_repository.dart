import '../models/todo.dart';

abstract interface class TodoRepository {
  Future<List<Todo>> fetchTodos();

  Future<List<Todo>> createTodo(String title);

  Future<bool> updateTodo(Todo todo);

  Future<bool> removeTodo(Todo todo);
}
