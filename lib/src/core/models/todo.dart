class Todo {
  Todo({
    required this.id,
    required this.title,
    this.done = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    try {
      if (json.containsKey("id") &&
          json.containsKey("title") &&
          json.containsKey("done")) {
        final id = json["id"];
        final title = json["title"];

        // NOTE: 'done' is sometimes a bool and other times a String.
        //       Thus it must be handled:
        final dynamic doneValue = json["done"];
        bool done;

        if (doneValue is bool) {
          done = doneValue;
        } else if (doneValue is String) {
          done = bool.tryParse(doneValue, caseSensitive: false) ?? false;
        } else {
          throw const FormatException(
              "Todo.fromJson() error: Invalid 'done' type.");
        }

        if (id is String && title is String) {
          return Todo(id: id, title: title, done: done);
        } else {
          throw const FormatException(
              "Todo.fromJson() error: Invalid types for 'id' or 'title'.");
        }
      } else {
        throw const FormatException("Todo.fromJson() error: Missing keys.");
      }
    } catch (e) {
      throw FormatException("Todo.fromJson() error: ${e.toString()}");
    }
  }

  final String id;
  final String title;
  final bool done;

  Todo copyWith({
    String? id,
    String? title,
    bool? done,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      done: done ?? this.done,
    );
  }
}
