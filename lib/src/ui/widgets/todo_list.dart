import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/models/todo.dart';
import '../state/todos_provider.dart';
import 'todo_list_tile.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<Todo> todoItems = TodoExtensions.samples;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, TodosProvider provider, _) {
      return ListView.separated(
        padding: const EdgeInsets.all(AppSizes.s10),
        itemCount: provider.itemCount,
        itemBuilder: (BuildContext context, int index) {
          final todo = provider.todos[index];
          return TodoListTile(
            todo: todo,
            onToggle: () => provider.toggle(todo),
            onDelete: () => provider.remove(todo),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      );
    });
  }
}
