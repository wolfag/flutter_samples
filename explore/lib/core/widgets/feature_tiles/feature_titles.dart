import 'package:explore/core/widgets/widgets.dart';
import 'package:explore/core/widgets/responsive.dart';
import 'package:flutter/material.dart';

class FeatureTitles extends StatelessWidget {
  final List<String> assets = [
    'assets/images/trekking.jpg',
    'assets/images/animals.jpg',
    'assets/images/photography.jpeg',
  ];
  final List<String> titles = ['Trekking', 'Animals', 'Photography'];

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: FeatureTitlesMobile(
        assets: assets,
        titles: titles,
      ),
      tablet: FeatureTitlesTablet(
        assets: assets,
        titles: titles,
      ),
    );
  }
}
