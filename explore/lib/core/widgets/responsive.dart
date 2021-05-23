import 'package:flutter/material.dart';

const MOBILE_MAX_WIDTH = 800;
const DESKTOP_MIN_WIDTH = 1200;

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget? desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < MOBILE_MAX_WIDTH;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= MOBILE_MAX_WIDTH &&
        MediaQuery.of(context).size.width < DESKTOP_MIN_WIDTH;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= DESKTOP_MIN_WIDTH;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constaints) {
        if (constaints.maxWidth >= DESKTOP_MIN_WIDTH) {
          return desktop ?? tablet;
        } else if (constaints.maxWidth >= 800) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
