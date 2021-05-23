import 'package:flutter/material.dart';

class FeatureHeadingMobile extends StatelessWidget {
  final String leadingTitle;
  final String tailTitle;

  const FeatureHeadingMobile({
    Key? key,
    required this.leadingTitle,
    required this.tailTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(),
        Text(
          leadingTitle,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          tailTitle,
          textAlign: TextAlign.end,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
