import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:provider/provider.dart';

import 'package:template/src/core/constants/app_constants.dart';
import 'package:template/src/ui/screens/add_todo_screen.dart';
import 'package:template/src/ui/screens/home_screen.dart';
import 'package:template/src/ui/state/todos_provider.dart';

import '../../../mocks/mock_todo_repository.dart';

void main() {
  group("AddTodoPage widget tests", () {
    late TodosProvider todosProvider;

    setUp(() {
      // Arrange
      todosProvider = TodosProvider(repository: MockTodoRepository());
    });

    Future<void> setUpAddTodoPage(WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => todosProvider,
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );

      final addTodoButton = find.byType(FloatingActionButton);
      await tester.tap(addTodoButton);
      await tester.pumpAndSettle(); // Navigate to AddTodoPage
      await tester.pump(Duration.zero);
    }

    testWidgets(
      "Navigate to AddTodoPage",
      (WidgetTester tester) async {
        // Arrange
        // Act
        await setUpAddTodoPage(tester);

        // Assert
        expect(find.byType(AddTodoScreen), findsOneWidget);
      },
    );

    testWidgets(
      "Add Todo Page has correct title on app bar",
      (WidgetTester tester) async {
        // Arrange
        await setUpAddTodoPage(tester);

        // Act
        final appBar = find.byType(AppBar);
        final title = find.descendant(
          of: appBar,
          matching: find.text(AppConstants.appTitle),
        );

        // Assert
        expect(title, findsOneWidget);
      },
    );

    testWidgets(
      "Add Todo Page has TextField widget",
      (WidgetTester tester) async {
        // Arrange
        await setUpAddTodoPage(tester);

        // Act
        final widget = find.byType(TextField);

        // Assert
        expect(widget, findsOneWidget);
      },
    );

    testWidgets(
      "Add Todo Page has ElevatedButton widget",
      (WidgetTester tester) async {
        // Arrange
        await setUpAddTodoPage(tester);

        // Act
        final widget = find.byType(ElevatedButton);

        // Assert
        expect(widget, findsOneWidget);
      },
    );

    testWidgets(
      "Add Todo Page button has correct text",
      (WidgetTester tester) async {
        // Arrange
        await setUpAddTodoPage(tester);

        // Act
        final buttonText = find.text("ADD");

        // Assert
        expect(buttonText, findsOneWidget);
      },
    );
  });
}
