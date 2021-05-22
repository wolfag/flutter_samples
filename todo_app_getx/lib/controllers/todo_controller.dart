import 'package:get_storage/get_storage.dart';
import 'package:todo_app_getx/models/todo.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  var todos = List<Todo>.empty().obs;

  @override
  void onInit() {
    List? storedTodos = GetStorage().read<List>('todos');

    if (storedTodos != null) {
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }

    ever<List<Todo>>(todos, (_) {
      GetStorage().write('todos', todos.toList());
    });
    super.onInit();
  }
}
