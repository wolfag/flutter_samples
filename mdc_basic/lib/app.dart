import 'package:flutter/material.dart';
import 'package:mdc_basic/colors.dart';
import 'package:mdc_basic/home.dart';
import 'package:mdc_basic/login.dart';
import 'package:mdc_basic/supplemental/cut_corners_border.dart';

final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: kShrinePurple,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: kShrinePurple,
      textTheme: ButtonTextTheme.primary,
      colorScheme: ColorScheme.light().copyWith(primary: kShrinePurple),
      // colorScheme: base.colorScheme.copyWith(secondary: kShrinePurple),
    ),
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(
      color: kShrineSurfaceWhite,
    ),
    // buttonBarTheme: base.buttonBarTheme.copyWith(
    //   buttonTextTheme: ButtonTextTheme.accent,
    // ),
    // cardColor: kShrineBackgroundWhite,
    // textSelectionTheme: TextSelectionThemeData(
    //   selectionColor: kShrinePink100,
    // ),
    // errorColor: kShrineErrorRed,
    inputDecorationTheme: InputDecorationTheme(
      border: CutCornersBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kShrineBrown900,
        ),
      ),
    ),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6.copyWith(
          fontSize: 18.0,
        ),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1
            .copyWith(fontWeight: FontWeight.w500, fontSize: 16.0),
      )
      .apply(
        fontFamily: 'Rubik',
        // displayColor: kShrineBrown900,
        // bodyColor: kShrineBrown900,
      );
}

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
      theme: _kShrineTheme,
      home: HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }
}
