import 'package:explore/core/widgets/responsive.dart';
import 'package:explore/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FloatingQuickAccessBar extends StatelessWidget {
  final List<String> items = ['Destination', 'Dates', 'People', 'Experience'];
  final List<IconData> icons = [
    Icons.location_on,
    Icons.date_range,
    Icons.people,
    Icons.wb_sunny
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Responsive(
        mobile: FloatingQuickAccessBarMobile(
          items: items,
          icons: icons,
        ),
        tablet: FloatingQuickAccessBarTablet(
          items: items,
        ),
      ),
    );
  }
}
