import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../core/constants/app_sizes.dart';
import '../state/todos_provider.dart';
import 'todo_list_tile.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TodosProvider>(context, listen: false).fetchTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, TodosProvider provider, _) {
      if (provider.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      final todos = provider.todos;
      if (todos.isEmpty) {
        return const Center(
          child: Text(
            "No todos yet.",
            style: TextStyle(fontSize: 24),
          ),
        );
      }

      return ListView.separated(
        padding: const EdgeInsets.all(AppSizes.s10),
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          final todo = todos[index];
          return TodoListTile(
            todo: todo,
            onToggle: () => provider.toggleTodo(todo),
            onDelete: () => provider.removeTodo(todo),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      );
    });
  }
}
