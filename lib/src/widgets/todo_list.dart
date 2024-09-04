import 'package:flutter/material.dart';

import '../core/app_sizes.dart';
import '../models/todo.dart';
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
    return ListView.separated(
      padding: const EdgeInsets.all(AppSizes.s10),
      itemCount: todoItems.length,
      itemBuilder: (BuildContext context, int index) {
        final todo = todoItems[index];
        return TodoListTile(
          todo: todo,
          onToggle: () {
            setState(() {
              todoItems[index] = todo.copyWith(done: !todo.done);
            });
          },
          onDelete: () {
            setState(() {
              todoItems.remove(todo);
            });
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
