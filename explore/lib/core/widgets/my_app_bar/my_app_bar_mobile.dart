import 'package:flutter/material.dart';

class MyAppBarMobile extends StatelessWidget implements PreferredSizeWidget {
  final double opacity;

  const MyAppBarMobile({
    Key? key,
    required this.opacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey.shade900.withOpacity(opacity),
      elevation: 0,
      title: Text(
        'EXPLORE',
        style: TextStyle(
          color: Colors.blueGrey.shade100,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          letterSpacing: 3,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
