import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/controllers/todo_controller.dart';
import 'package:todo_app_getx/models/todo.dart';

class TodoScreen extends GetWidget {
  final todoController = Get.find<TodoController>();
  String submitText = 'Add';

  int todoId = 0;
  Todo todo = Todo(text: '', id: 0);

  TodoScreen({this.todoId = 0});

  @override
  Widget build(BuildContext context) {
    if (todoId != 0) {
      todo = todoController.todos.firstWhere((element) => element.id == todoId);
      submitText = 'Update';
    }
    final TextEditingController _textController =
        TextEditingController(text: todo.text);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'What do you want to accomplist?',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: TextStyle(fontSize: 25.0),
                keyboardType: TextInputType.multiline,
                maxLines: 999,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    todo.text = _textController.text;

                    if (todoId != 0) {
                      final todoIndex = todoController.todos
                          .indexWhere((element) => element.id == todoId);
                      todoController.todos[todoIndex] = todo;
                    } else {
                      todo.id = DateTime.now().millisecondsSinceEpoch;
                      todoController.todos.add(todo);
                    }
                    Get.back();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  child: Text(submitText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
