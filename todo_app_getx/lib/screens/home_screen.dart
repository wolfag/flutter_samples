import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/controllers/todo_controller.dart';
import 'package:todo_app_getx/models/todo.dart';
import 'package:todo_app_getx/screens/todo_screen.dart';

class HomeScreen extends GetWidget {
  @override
  Widget build(BuildContext context) {
    final todoController = Get.put(TodoController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Getx Todo list'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TodoScreen());
        },
      ),
      body: Container(
        child: Obx(
          () {
            return ListView.separated(
              itemBuilder: (context, index) {
                final style = todoController.todos[index].done
                    ? TextStyle(
                        color: Colors.green,
                        decoration: TextDecoration.lineThrough,
                      )
                    : TextStyle(
                        color: Colors.amber,
                      );

                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (_) {
                    Todo removed = todoController.todos[index];
                    todoController.todos.removeAt(index);
                    Get.snackbar(
                      'Task Removed',
                      'The task \'${removed.text}\' was successfully removed.',
                      mainButton: TextButton(
                        onPressed: () {
                          todoController.todos.insert(index, removed);
                          if (Get.isSnackbarOpen ?? false) {
                            Get.back();
                          }
                        },
                        child: Text(
                          'Undo',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      todoController.todos[index].text,
                      style: style,
                    ),
                    onTap: () {
                      Get.to(
                        TodoScreen(
                          todoId: todoController.todos[index].id,
                        ),
                      );
                    },
                    leading: Checkbox(
                      value: todoController.todos[index].done,
                      onChanged: (v) {
                        final todo = todoController.todos[index];
                        todo.done = v ?? false;
                        todoController.todos[index] = todo;
                      },
                    ),
                    trailing: Icon(Icons.chevron_right),
                  ),
                );
              },
              separatorBuilder: (_, __) => Divider(),
              itemCount: todoController.todos.length,
            );
          },
        ),
      ),
    );
  }
}
