import 'package:explore/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FeatureHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    String leadingTitle = 'Featured';
    String tailTitle = 'Unnique wildlife tour & destinnations';

    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: Responsive(
        mobile: FeatureHeadingMobile(
          leadingTitle: leadingTitle,
          tailTitle: tailTitle,
        ),
        tablet: FeatureHeadingTablet(
            leadingTitle: leadingTitle, tailTitle: tailTitle),
      ),
    );
  }
}
