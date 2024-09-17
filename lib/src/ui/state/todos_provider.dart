import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../../core/enums/todo_filter.dart';
import '../../core/models/todo.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [];

  // final List<Todo> _todos = TodoExtensions.samples;

  TodoFilter _todoFilter = TodoFilter.all;

  TodoFilter get todoFilter => _todoFilter;

  UnmodifiableListView<Todo> get todos => switch (_todoFilter) {
        TodoFilter.all => UnmodifiableListView(_todos),
        TodoFilter.done => UnmodifiableListView(_todos.where((t) => t.done)),
        TodoFilter.undone => UnmodifiableListView(_todos.where((t) => !t.done)),
      };

  int get itemCount => todos.length;

  void changeFilter(TodoFilter todoFilter) {
    _todoFilter = todoFilter;
    notifyListeners();
  }

  void add(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void toggle(Todo todo) {
    int index = _todos.indexOf(todo);
    _todos[index] = todo.copyWith(done: !todo.done);
    notifyListeners();
  }

  void remove(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
