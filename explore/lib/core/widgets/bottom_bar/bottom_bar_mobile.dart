import 'package:flutter/material.dart';

class BottomBarMobile extends StatelessWidget {
  final Widget emailInforText;
  final Widget addressInforText;
  final Widget copyRight;
  final Widget aboutColumn;
  final Widget helpColumn;
  final Widget socialColumn;

  const BottomBarMobile({
    Key? key,
    required this.emailInforText,
    required this.addressInforText,
    required this.copyRight,
    required this.aboutColumn,
    required this.helpColumn,
    required this.socialColumn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            aboutColumn,
            helpColumn,
            socialColumn,
          ],
        ),
        Divider(
          color: Colors.blueGrey,
        ),
        SizedBox(
          height: 20,
        ),
        emailInforText,
        SizedBox(
          height: 5,
        ),
        addressInforText,
        SizedBox(
          height: 30,
        ),
        Divider(
          color: Colors.blueGrey,
        ),
        SizedBox(height: 20),
        copyRight,
      ],
    );
  }
}
