import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:provider/provider.dart';

import 'package:template/src/core/constants/app_constants.dart';
import 'package:template/src/ui/screens/home_screen.dart';
import 'package:template/src/ui/state/todos_provider.dart';
import 'package:template/src/ui/widgets/todo_filter_menu.dart';
import 'package:template/src/ui/widgets/todo_list.dart';

import '../../../mocks/mock_todo_repository.dart';

void main() {
  group("HomePage widget tests", () {
    late TodosProvider todosProvider;

    setUp(() {
      // Arrange
      todosProvider = TodosProvider(repository: MockTodoRepository());
    });

    Future<void> setUpHomePage(WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => todosProvider,
          child: const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      );
    }

    testWidgets(
      "Home Page has correct title on app bar",
      (WidgetTester tester) async {
        // Arrange
        await setUpHomePage(tester);

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
      "Home Page has TodoList widget",
      (WidgetTester tester) async {
        // Arrange
        await setUpHomePage(tester);

        // Act
        final widget = find.byType(TodoList);

        // Assert
        expect(widget, findsOneWidget);
      },
    );

    testWidgets(
      "Home Page has TodoFilterMenu widget",
      (WidgetTester tester) async {
        // Arrange
        await setUpHomePage(tester);

        // Act
        final widget = find.byType(TodoFilterMenu);

        // Assert
        expect(widget, findsOneWidget);
      },
    );

    testWidgets(
      "Home Page has FloatingActionButton widget",
      (WidgetTester tester) async {
        // Arrange
        await setUpHomePage(tester);

        // Act
        final widget = find.byType(FloatingActionButton);

        // Assert
        expect(widget, findsOneWidget);
      },
    );
  });
}
