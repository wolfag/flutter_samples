import 'package:explore/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FloatingQuickAccessBarTablet extends StatefulWidget {
  final List<String> items;

  const FloatingQuickAccessBarTablet({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  _FloatingQuickAccessBarTabletState createState() =>
      _FloatingQuickAccessBarTabletState();
}

class _FloatingQuickAccessBarTabletState
    extends State<FloatingQuickAccessBarTablet> {
  List<Widget> generateElement(BuildContext context) {
    List<Widget> result = [];
    var screenSize = MediaQuery.of(context).size;
    for (int i = 0; i < widget.items.length; i++) {
      Widget elementTitle = ButtonHover(
        title: widget.items[i],
        onTap: () {},
        textStyle: TextStyle(
          color: Colors.blueGrey,
          fontSize: 15,
        ),
        hoverTextStyle: TextStyle(
          color: Colors.blueGrey[900],
          fontSize: 20,
        ),
        showUnderline: false,
      );

      Widget spacer = SizedBox(
        height: screenSize.height / 30,
        child: VerticalDivider(
          width: 1,
          color: Colors.blueGrey[100],
          thickness: 1,
        ),
      );

      result.add(elementTitle);
      if (i < widget.items.length - 1) {
        result.add(spacer);
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.4,
        left: screenSize.width / 5,
        right: screenSize.width / 5,
      ),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: screenSize.height / 50,
            bottom: screenSize.height / 50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: generateElement(context),
          ),
        ),
      ),
    );
  }
}
