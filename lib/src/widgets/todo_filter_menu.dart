import 'package:flutter/material.dart';

import '../enums/todo_filter.dart';

class TodoFilterMenu extends StatefulWidget {
  const TodoFilterMenu({
    super.key,
    required this.onFilterSelected,
  });

  final Function(TodoFilter) onFilterSelected;

  @override
  State<TodoFilterMenu> createState() => _TodoFilterMenuState();
}

class _TodoFilterMenuState extends State<TodoFilterMenu> {
  TodoFilter _selectedFilter = TodoFilter.all;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<TodoFilter>(
      initialValue: _selectedFilter,
      onSelected: (TodoFilter selection) {
        setState(() => _selectedFilter = selection);
        widget.onFilterSelected(_selectedFilter);
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem<TodoFilter>(
            value: TodoFilter.all,
            child: Text(TodoFilter.all.name),
          ),
          PopupMenuItem<TodoFilter>(
            value: TodoFilter.done,
            child: Text(TodoFilter.done.name),
          ),
          PopupMenuItem<TodoFilter>(
            value: TodoFilter.undone,
            child: Text(TodoFilter.undone.name),
          ),
        ];
      },
    );
  }
}
