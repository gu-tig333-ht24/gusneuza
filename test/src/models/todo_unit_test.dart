import 'package:flutter_test/flutter_test.dart';

import 'package:template/src/core/models/todo.dart';

void main() {
  group("Todo class unit tests", () {
    test("Todo properties have correct values upon instantiation", () {
      const todoId = "1";
      const todoTitle = "Do something";
      final todo = Todo(id: todoId, title: todoTitle);

      expect(todo.id, todoId);
      expect(todo.title, todoTitle);
      expect(todo.done, false);
    });
  });
}
