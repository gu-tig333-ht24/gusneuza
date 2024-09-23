import 'package:flutter/material.dart';

import '../../core/constants/app_sizes.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/todo_filter_menu.dart';
import '../widgets/todo_list.dart';
import 'add_todo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppSizes.s10),
            child: TodoFilterMenu(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddTodoScreen()),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: const TodoList(),
    );
  }
}
