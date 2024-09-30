import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'src/app.dart';
import 'src/networking/api_todo_repository.dart';
import 'src/ui/state/todos_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TodosProvider(repository: ApiTodoRepository()),
      child: const App(),
    ),
  );
}
