import 'package:flutter/material.dart';
import 'package:template/src/pages/add_todo_page.dart';

import '../enums/todo_filter.dart';
import '../models/todo.dart';
import '../widgets/todo_filter_menu.dart';

List<Todo> _todoItems = [
  Todo(id: "1", title: "Write a book"),
  Todo(id: "2", title: "Do homework"),
  Todo(id: "3", title: "Tidy room", done: true),
  Todo(id: "4", title: "Watch TV"),
  Todo(id: "5", title: "Nap"),
  Todo(id: "6", title: "Shop groceries"),
  Todo(id: "7", title: "Have fun"),
  Todo(id: "8", title: "Meditate"),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TodoFilterMenu(
            onFilterSelected: (TodoFilter newSelection) {},
          ),
        ],
        centerTitle: true,
        title: Text("Todos"),
        backgroundColor: Colors.deepPurpleAccent.shade100,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddTodoPage()),
          );
        },
        child: Icon(Icons.add_rounded),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(0),
        itemCount: _todoItems.length,
        itemBuilder: (BuildContext context, int index) {
          var item = _todoItems[index];
          return ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Checkbox(value: item.done, onChanged: (_) {}),
            title: Text(
              item.title,
              style: TextStyle(
                  decoration: item.done
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.close_rounded),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
