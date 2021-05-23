import 'package:explore/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  Widget emailInforText() {
    return InfoText(label: 'Email', value: 'wolfag91@gmail.com');
  }

  Widget addressInforText() {
    return InfoText(label: 'Address', value: '25 HCM');
  }

  Widget copyRight() {
    return Text(
      'Copyright © 2021 | EXPLORE',
      style: TextStyle(
        color: Colors.blueGrey.shade300,
        fontSize: 14,
      ),
    );
  }

  Widget aboutColumn() {
    return BottomBarColumn(
      heading: 'ABOUT',
      subsHeading: [
        'Contact Us',
        'About Us',
        'Careers',
      ],
    );
  }

  Widget helpColumn() {
    return BottomBarColumn(
      heading: 'HELP',
      subsHeading: [
        'Payment',
        'Cancelationn',
        'FAQ',
      ],
    );
  }

  Widget socialColumn() {
    return BottomBarColumn(
      heading: 'SOCIAL',
      subsHeading: [
        'Twitter',
        'Facebook',
        'Yourtube',
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.blueGrey[900],
      child: Responsive(
        tablet: BottomBarDesktop(
          emailInforText: emailInforText(),
          addressInforText: addressInforText(),
          copyRight: copyRight(),
          aboutColumn: aboutColumn(),
          helpColumn: helpColumn(),
          socialColumn: socialColumn(),
        ),
        mobile: BottomBarMobile(
          emailInforText: emailInforText(),
          addressInforText: addressInforText(),
          copyRight: copyRight(),
          aboutColumn: aboutColumn(),
          helpColumn: helpColumn(),
          socialColumn: socialColumn(),
        ),
      ),
    );
  }
}
