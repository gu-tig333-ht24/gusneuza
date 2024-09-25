import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../../core/enums/todo_filter.dart';
import '../../core/interfaces/todo_repository.dart';
import '../../core/models/todo.dart';

class TodosProvider extends ChangeNotifier {
  TodosProvider({required TodoRepository repository})
      : _repository = repository;
  final TodoRepository _repository;

  bool _isLoading = false;

  List<Todo> _todos = [];

  TodoFilter _todoFilter = TodoFilter.all;

  UnmodifiableListView<Todo> get todos => switch (_todoFilter) {
        TodoFilter.all => UnmodifiableListView(_todos),
        TodoFilter.done => UnmodifiableListView(_todos.where((t) => t.done)),
        TodoFilter.undone => UnmodifiableListView(_todos.where((t) => !t.done)),
      };

  int get itemCount => todos.length;

  bool get isLoading => _isLoading;

  TodoFilter get todoFilter => _todoFilter;

  Future<void> fetchTodos() async {
    _isLoading = true;
    notifyListeners();

    _todos = await _repository.fetchTodos();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addTodo(String title) async {
    _isLoading = true;
    notifyListeners();

    _todos = await _repository.createTodo(title);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> toggleTodo(Todo todo) async {
    _isLoading = true;
    notifyListeners();

    if (await _repository.updateTodo(todo)) {
      int index = _todos.indexWhere((t) => t.id == todo.id);
      if (index != -1) {
        _todos[index] = todo.copyWith(done: !todo.done);
      }
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> removeTodo(Todo todo) async {
    _isLoading = true;
    notifyListeners();

    if (await _repository.removeTodo(todo)) {
      _todos.remove(todo);
    }

    _isLoading = false;
    notifyListeners();
  }

  void changeTodoFilter(TodoFilter todoFilter) {
    _todoFilter = todoFilter;
    notifyListeners();
  }
}
