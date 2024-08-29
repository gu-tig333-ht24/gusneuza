import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(0),
      itemCount: TodoExtensions.samples.length,
      itemBuilder: (BuildContext context, int index) {
        var item = TodoExtensions.samples[index];
        return ListTile(
          contentPadding: const EdgeInsets.all(0),
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
            icon: const Icon(Icons.close_rounded),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
