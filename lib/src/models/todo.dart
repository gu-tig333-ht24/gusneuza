class Todo {
  Todo({
    required this.id,
    required this.title,
    this.done = false,
  });

  final String id;
  final String title;
  final bool done;
}

extension TodoExtensions on Todo {
  static List<Todo> samples = [
    Todo(id: "1", title: "Write a book"),
    Todo(id: "2", title: "Do homework"),
    Todo(id: "3", title: "Tidy room", done: true),
    Todo(id: "4", title: "Watch TV"),
    Todo(id: "5", title: "Nap"),
    Todo(id: "6", title: "Shop groceries"),
    Todo(id: "7", title: "Have fun"),
    Todo(id: "8", title: "Meditate"),
  ];
}
