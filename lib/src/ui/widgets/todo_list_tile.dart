import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/models/todo.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  });

  final Todo todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(AppSizes.s0),
      leading: Checkbox(
        value: todo.done,
        onChanged: (_) => onToggle(),
      ),
      title: Text(
        todo.title,
        style: TextStyle(
          decoration: todo.done ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        onPressed: onDelete,
        icon: const Icon(Icons.close_rounded),
      ),
    );
  }
}
