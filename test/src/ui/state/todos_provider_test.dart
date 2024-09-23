import 'package:flutter_test/flutter_test.dart';

import 'package:template/src/core/enums/todo_filter.dart';
import 'package:template/src/core/models/todo.dart';
import 'package:template/src/ui/state/todos_provider.dart';

void main() {
  group("TodoProvider unit tests", () {
    test("TodosProvider should have zero items initially", () {
      // Arrange
      final todosProvider = TodosProvider();

      // Assert
      expect(todosProvider.itemCount, 0);
    });

    test("When a Todo is added, itemCount should increment", () {
      // Arrange
      final todosProvider = TodosProvider();

      // Act
      todosProvider.add(
        Todo(id: "1", title: "Climb Mount Everest"),
      );

      // Assert
      expect(todosProvider.itemCount, 1);
    });

    test("Toggling a todo has correct 'done' value", () {
      // Arrange
      final todosProvider = TodosProvider();
      final todo = Todo(id: "1", title: "Climb Mount Everest");
      todosProvider.add(todo);

      // Act
      todosProvider.toggle(todo);
      final updatedTodo = todosProvider.todos.first;

      // Assert
      expect(updatedTodo.done, true);
    });

    test("Removing a Todo should result in an empty TodosProvider", () {
      // Arrange
      final todosProvider = TodosProvider();
      final todo = Todo(id: "1", title: "Climb Mount Everest");
      todosProvider.add(todo);

      // Act
      todosProvider.remove(todo);

      // Assert
      expect(todosProvider.itemCount, 0);
    });

    test("'todoFilter' should be updated after calling changeFilter", () {
      // Arrange
      final todosProvider = TodosProvider();
      const expectedFilter = TodoFilter.undone;

      // Act
      todosProvider.changeFilter(expectedFilter);

      // Assert
      expect(todosProvider.todoFilter, expectedFilter);
    });

    test("'itemCount' reflects correct count after changing TodoFilter", () {
      // Arrange
      const itemCountToFilter = {
        3: TodoFilter.all,
        2: TodoFilter.done,
        1: TodoFilter.undone,
      };
      final todosProvider = TodosProvider();
      final sampleTodos = [
        Todo(id: "1", title: "Yes", done: true),
        Todo(id: "2", title: "Maybe", done: true),
        Todo(id: "3", title: "No"),
      ];
      sampleTodos.forEach(todosProvider.add);

      itemCountToFilter.forEach((int expectedItemCount, TodoFilter filter) {
        // Act
        todosProvider.changeFilter(filter);

        // Assert
        expect(todosProvider.itemCount, expectedItemCount);
      });
    });
  });
}
