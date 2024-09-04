import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:template/src/core/constants/app_constants.dart';
import 'package:template/src/ui/pages/add_todo_page.dart';
import 'package:template/src/ui/pages/home_page.dart';

void main() {
  group("AddTodoPage widget tests", () {
    Future<void> setUpAddTodoPage(WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
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
        expect(find.byType(AddTodoPage), findsOneWidget);
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
