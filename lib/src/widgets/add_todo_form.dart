import 'package:flutter/material.dart';

import '../core/app_sizes.dart';

class AddTodoForm extends StatefulWidget {
  const AddTodoForm({
    super.key,
    required this.onValidSubmit,
  });

  final Function(String title) onValidSubmit;

  @override
  State<AddTodoForm> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onAddButtonPressed() {
    if (_formKey.currentState!.validate()) {
      widget.onValidSubmit(_titleController.text);
      _titleController.text = "";
    }

    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "This is required";
              }
              return null;
            },
            controller: _titleController,
            focusNode: _focusNode,
            autofocus: true,
            maxLines: 1,
            autocorrect: false,
            enableIMEPersonalizedLearning: false,
            enableSuggestions: false,
            cursorColor: Colors.deepPurpleAccent,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => _titleController.clear(),
                icon: const Icon(Icons.clear_rounded),
              ),
              hintText: "What are you going to do?",
            ),
          ),
          const SizedBox(height: AppSizes.s20),
          ElevatedButton(
            onPressed: _onAddButtonPressed,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_rounded),
                SizedBox(width: AppSizes.s10),
                Text("ADD"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
