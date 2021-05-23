import 'package:explore/core/widgets/my_app_bar/my_app_bar_mobile.dart';
import 'package:explore/core/widgets/responsive.dart';
import 'package:explore/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final double opacicy;

  const MyAppBar({
    Key? key,
    required this.opacicy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MyAppBarMobile(
        opacity: opacicy,
      ),
      tablet: MyAppBarTablet(opacity: opacicy),
    );
  }
}
