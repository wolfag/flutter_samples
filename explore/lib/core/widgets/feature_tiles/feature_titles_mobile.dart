import 'package:flutter/material.dart';

class FeatureTitlesMobile extends StatelessWidget {
  final List<String> assets;
  final List<String> titles;

  const FeatureTitlesMobile({
    Key? key,
    required this.assets,
    required this.titles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: screenSize.height / 50),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: screenSize.width / 15,
            ),
            ...Iterable<int>.generate(assets.length).map(
              (index) => Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenSize.width / 2.5,
                        width: screenSize.width / 1.5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            assets[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenSize.height / 70),
                        child: Text(
                          titles[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenSize.width / 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
