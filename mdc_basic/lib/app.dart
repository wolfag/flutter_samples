import 'package:flutter/material.dart';
import 'package:mdc_basic/home.dart';
import 'package:mdc_basic/login.dart';

class ShrineApp extends StatelessWidget {
  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }
    return MaterialPageRoute<void>(
      settings: settings,
      fullscreenDialog: true,
      builder: (context) => LoginPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      home: HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }
}
