import 'package:flutter/material.dart';

class BottomBarDesktop extends StatelessWidget {
  final Widget emailInforText;
  final Widget addressInforText;
  final Widget copyRight;
  final Widget aboutColumn;
  final Widget helpColumn;
  final Widget socialColumn;

  const BottomBarDesktop({
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            aboutColumn,
            helpColumn,
            socialColumn,
            Container(
              color: Colors.blueGrey,
              width: 2,
              height: 150,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                emailInforText,
                addressInforText,
              ],
            ),
          ],
        ),
        Divider(
          color: Colors.blueGrey,
        ),
        SizedBox(
          height: 20,
        ),
        copyRight,
      ],
    );
  }
}
