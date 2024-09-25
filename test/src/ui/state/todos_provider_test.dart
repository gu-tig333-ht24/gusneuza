import 'package:flutter_test/flutter_test.dart';

import 'package:template/src/core/enums/todo_filter.dart';
import 'package:template/src/ui/state/todos_provider.dart';

import '../../../mocks/mock_todo_repository.dart';

void main() {
  group("TodoProvider unit tests", () {
    late TodosProvider todosProvider;

    setUp(() {
      // Arrange
      todosProvider = TodosProvider(repository: MockTodoRepository());
    });

    test("TodosProvider should have zero items initially", () {
      // Assert
      expect(todosProvider.itemCount, 0);
    });

    test("When a Todo is added, itemCount should increment", () async {
      // Act
      await todosProvider.addTodo("Climb Mount Everest");

      // Assert
      expect(todosProvider.itemCount, 1);
    });

    test("Toggling a todo has correct 'done' value", () async {
      // Arrange
      await todosProvider.addTodo("Climb Mount Everest");
      final todo = todosProvider.todos.first;

      // Act
      await todosProvider.toggleTodo(todo);
      final updatedTodo = todosProvider.todos.first;

      // Assert
      expect(updatedTodo.done, true);
    });

    test("Removing a Todo should result in an empty TodosProvider", () async {
      // Arrange
      await todosProvider.addTodo("Climb Mount Everest");
      final todo = todosProvider.todos.first;

      // Act
      await todosProvider.removeTodo(todo);

      // Assert
      expect(todosProvider.itemCount, 0);
    });

    test("'todoFilter' should be updated after calling changeFilter", () {
      // Arrange
      const expectedFilter = TodoFilter.undone;

      // Act
      todosProvider.changeTodoFilter(expectedFilter);

      // Assert
      expect(todosProvider.todoFilter, expectedFilter);
    });

    test("'itemCount' reflects correct count after changing TodoFilter",
        () async {
      // Arrange
      const itemCountToFilter = {
        3: TodoFilter.all,
        2: TodoFilter.done,
        1: TodoFilter.undone,
      };
      for (var title in ["Yes", "Maybe", "No"]) {
        await todosProvider.addTodo(title);
      }
      final todos = todosProvider.todos;
      todosProvider.toggleTodo(todos[0]);
      todosProvider.toggleTodo(todos[1]);

      itemCountToFilter.forEach((int expectedItemCount, TodoFilter filter) {
        // Act
        todosProvider.changeTodoFilter(filter);

        // Assert
        expect(todosProvider.itemCount, expectedItemCount);
      });
    });
  });
}
