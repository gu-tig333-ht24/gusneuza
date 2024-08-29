import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../enums/todo_filter.dart';
import '../widgets/todo_filter_menu.dart';
import '../widgets/todo_list.dart';
import 'add_todo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TodoFilterMenu(
            onFilterSelected: (TodoFilter newSelection) {},
          ),
        ],
        title: const Text(AppConstants.appTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddTodoPage()),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: const TodoList(),
    );
  }
}
