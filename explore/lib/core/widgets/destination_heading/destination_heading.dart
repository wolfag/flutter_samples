import 'package:flutter/material.dart';

import 'package:explore/core/widgets/widgets.dart';

class DestinationHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _title = 'Destinations diversity';

    return Responsive(
      mobile: DestinationHeadingMobile(
        title: _title,
      ),
      tablet: DestinationHeadingTablet(
        title: _title,
      ),
    );
  }
}
