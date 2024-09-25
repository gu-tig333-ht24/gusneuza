import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:provider/provider.dart';

import 'package:template/src/core/enums/todo_filter.dart';
import 'package:template/src/core/utils/string_extensions.dart';
import 'package:template/src/ui/screens/home_screen.dart';
import 'package:template/src/ui/state/todos_provider.dart';

import '../../../mocks/mock_todo_repository.dart';

void main() {
  group("TodoFilterMenu widget tests", () {
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

    testWidgets("Updates TodoFilter when selecting 'done' from TodoFilterMenu",
        (WidgetTester tester) async {
      // Arrange
      await setUpHomePage(tester);
      final todosProvider = Provider.of<TodosProvider>(
          tester.element(find.byType(HomeScreen)),
          listen: false);

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

      // Assert
      expect(todosProvider.todoFilter, TodoFilter.done);
    });
  });
}
