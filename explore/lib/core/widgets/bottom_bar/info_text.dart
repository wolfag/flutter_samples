import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback? onTap;

  const InfoText({
    Key? key,
    required this.label,
    required this.value,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              color: Colors.blueGrey.shade300,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.blueGrey.shade100,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
