import 'package:flutter/material.dart';

class FeatureHeadingTablet extends StatelessWidget {
  final String leadingTitle;
  final String tailTitle;

  const FeatureHeadingTablet({
    Key? key,
    required this.leadingTitle,
    required this.tailTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          leadingTitle,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(
            tailTitle,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
