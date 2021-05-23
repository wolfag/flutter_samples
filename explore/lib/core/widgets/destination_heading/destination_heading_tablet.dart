import 'package:flutter/material.dart';

class DestinationHeadingTablet extends StatelessWidget {
  final String title;

  const DestinationHeadingTablet({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(
        top: screenSize.height / 10,
        bottom: screenSize.height / 15,
      ),
      width: screenSize.width,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
