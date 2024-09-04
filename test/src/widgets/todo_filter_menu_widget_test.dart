import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:template/src/enums/todo_filter.dart';
import 'package:template/src/pages/home_page.dart';
import 'package:template/src/utils/string_extensions.dart';
import 'package:template/src/widgets/todo_filter_menu.dart';

void main() {
  group("TodoFilterMenu widget tests", () {
    Future<void> setUpHomePage(WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomePage(),
        ),
      );
    }

    testWidgets(
      "TodoFilterMenu widget has correct amount of options",
      (WidgetTester tester) async {
        // Arrange
        await setUpHomePage(tester);

        // Act
        final popupMenuButton = find.byType(PopupMenuButton<TodoFilter>);

        // The PopupMenuItem widgets are only created when the menu is opened
        await tester.tap(popupMenuButton);
        await tester.pumpAndSettle();

        final items = find.byType(PopupMenuItem<TodoFilter>);

        // Assert
        expect(items, findsNWidgets(TodoFilter.values.length));
      },
    );

    testWidgets(
        "TodoFilterMenu widget onFilterSelected callback works correctly",
        (WidgetTester tester) async {
      // Arrange
      TodoFilter? selectedFilter;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TodoFilterMenu(
              onFilterSelected: (TodoFilter? newSelection) {
                selectedFilter = newSelection;
              },
            ),
          ),
        ),
      );

      // Act
      final popupMenuButton = find.byType(PopupMenuButton<TodoFilter>);

      // Tap to open the menu
      await tester.tap(popupMenuButton);
      await tester.pumpAndSettle();

      // Find the second item (TodoFilter.done) in the menu
      final secondItemFinder = find.text(TodoFilter.done.name.capitalized);
      expect(secondItemFinder, findsOneWidget);

      // Tap the second item
      await tester.tap(secondItemFinder);
      await tester.pumpAndSettle();

      expect(selectedFilter, TodoFilter.done);
    });
  });
}
