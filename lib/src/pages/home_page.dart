import 'package:flutter/material.dart';

import '../core/app_sizes.dart';
import '../enums/todo_filter.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/todo_filter_menu.dart';
import '../widgets/todo_list.dart';
import 'add_todo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSizes.s10),
            child: TodoFilterMenu(
              onFilterSelected: (TodoFilter newSelection) {},
            ),
          )
        ],
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
