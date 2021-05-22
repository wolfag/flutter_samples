import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:todo_app_getx/screens/home_screen.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}
