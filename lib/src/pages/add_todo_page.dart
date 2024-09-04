import 'package:flutter/material.dart';

import '../core/app_sizes.dart';
import '../models/todo.dart';
import '../widgets/add_todo_form.dart';
import '../widgets/custom_app_bar.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.s20),
        child: AddTodoForm(
          onValidSubmit: (String title) {
            // TODO: save todo
            final todo = Todo(id: "", title: title);

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
