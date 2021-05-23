import 'package:flutter/material.dart';

class FloatingQuickAccessBarMobile extends StatelessWidget {
  final List<IconData> icons;
  final List<String> items;

  const FloatingQuickAccessBarMobile({
    Key? key,
    required this.icons,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.4,
        left: screenSize.width / 12,
        right: screenSize.width / 12,
      ),
      child: Column(
        children: [
          ...Iterable<int>.generate(items.length).map(
            (index) => Padding(
              padding: EdgeInsets.only(
                top: screenSize.height / 80,
              ),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height / 45,
                    bottom: screenSize.height / 45,
                    left: screenSize.width / 20,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        icons[index],
                        color: Colors.blueGrey,
                      ),
                      SizedBox(
                        width: screenSize.width / 20,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () {},
                        child: Text(
                          items[index],
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
