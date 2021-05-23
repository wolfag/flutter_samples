import 'package:flutter/material.dart';

class BottomBarColumn extends StatelessWidget {
  final String heading;
  final List<String>? subsHeading;

  const BottomBarColumn({
    Key? key,
    required this.heading,
    this.subsHeading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          heading,
          style: TextStyle(
            color: Colors.blueGrey[300],
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        if (subsHeading != null && subsHeading!.isNotEmpty)
          for (var subHeading in subsHeading!)
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Text(
                subHeading,
                style: TextStyle(
                  color: Colors.blueGrey[100],
                  fontSize: 14,
                ),
              ),
            )
        else
          Container(),
      ]),
    );
  }
}
