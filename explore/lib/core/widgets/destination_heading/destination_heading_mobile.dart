import 'package:flutter/material.dart';

class DestinationHeadingMobile extends StatelessWidget {
  final String title;

  const DestinationHeadingMobile({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: screenSize.width / 20),
      width: screenSize.width,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
