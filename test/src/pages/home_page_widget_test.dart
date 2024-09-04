import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:template/src/core/constants/app_constants.dart';
import 'package:template/src/ui/pages/home_page.dart';
import 'package:template/src/ui/widgets/todo_filter_menu.dart';
import 'package:template/src/ui/widgets/todo_list.dart';

void main() {
  group("HomePage widget tests", () {
    Future<void> setUpHomePage(WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
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
