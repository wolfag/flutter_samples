import 'package:flutter/material.dart';
import 'package:mdc_basic/backdrop.dart';
import 'package:mdc_basic/category_menu_page.dart';
import 'package:mdc_basic/colors.dart';
import 'package:mdc_basic/home.dart';
import 'package:mdc_basic/login.dart';
import 'package:mdc_basic/model/product.dart';
import 'package:mdc_basic/supplemental/cut_corners_border.dart';

final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kShrinePink100,
      onPrimary: kShrineBrown900,
      secondary: kShrineBrown900,
      error: kShrineErrorRed,
    ),
    appBarTheme: base.appBarTheme.copyWith(
      backwardsCompatibility: false,
    ),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: kShrinePink100,
    ),

    // primaryColor: kShrinePurple,
    // buttonTheme: base.buttonTheme.copyWith(
    //   buttonColor: kShrinePurple,
    //   textTheme: ButtonTextTheme.primary,
    //   colorScheme: ColorScheme.light().copyWith(primary: kShrinePurple),
    //   // colorScheme: base.colorScheme.copyWith(secondary: kShrinePurple),
    // ),
    // scaffoldBackgroundColor: kShrineBackgroundWhite,
    // accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    // primaryIconTheme: base.iconTheme.copyWith(
    //   color: kShrineSurfaceWhite,
    // ),
    // buttonBarTheme: base.buttonBarTheme.copyWith(
    //   buttonTextTheme: ButtonTextTheme.accent,
    // ),
    // cardColor: kShrineBackgroundWhite,

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

class ShrineApp extends StatefulWidget {
  @override
  _ShrineAppState createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    print(category);
    setState(() {
      _currentCategory = category;
    });
  }

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
      home: Backdrop(
        currentCategory: _currentCategory,
        frontLayer: HomePage(
          category: _currentCategory,
        ),
        backLayer: CategoryMenuPage(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: Text('SHRINE'),
        backTitle: Text('MENU'),
      ),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }
}
