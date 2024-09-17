import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../core/enums/todo_filter.dart';
import '../../core/utils/string_extensions.dart';
import '../state/todos_provider.dart';

class TodoFilterMenu extends StatelessWidget {
  const TodoFilterMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, TodosProvider provider, _) {
      return PopupMenuButton<TodoFilter>(
        initialValue: provider.todoFilter,
        onSelected: provider.changeFilter,
        itemBuilder: (BuildContext context) => TodoFilter.values
            .map(
              (TodoFilter filter) => PopupMenuItem(
                value: filter,
                child: Text(filter.name.capitalized),
              ),
            )
            .toList(),
      );
    });
  }
}
