import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../core/constants/app_sizes.dart';
import '../../core/models/todo.dart';
import '../state/todos_provider.dart';
import '../widgets/add_todo_form.dart';
import '../widgets/custom_app_bar.dart';

class AddTodoScreen extends StatelessWidget {
  const AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.s20),
        child: AddTodoForm(
          onValidSubmit: (String title) {
            final todo = Todo(id: "", title: title);
            Provider.of<TodosProvider>(context, listen: false).add(todo);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Todo added."),
              ),
            );
          },
        ),
      ),
    );
  }
}
