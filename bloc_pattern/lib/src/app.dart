import 'package:bloc_pattern/src/ui/user_list.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: UserList(),
        // body: Text('hello'),
      ),
    );
  }
}
