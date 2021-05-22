class Todo {
  int id;
  String text;
  bool done;

  Todo({
    required this.id,
    required this.text,
    this.done = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'],
        text: json['text'],
        done: json['done'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'done': done,
      };

  @override
  String toString() => 'Todo(id: $id, text: $text, done: $done)';
}
