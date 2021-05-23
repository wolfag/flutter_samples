import 'package:flutter/material.dart';

class ButtonHover extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool showUnderline;
  final TextStyle? textStyle;
  final TextStyle? hoverTextStyle;

  const ButtonHover({
    Key? key,
    required this.title,
    required this.onTap,
    this.showUnderline = true,
    this.textStyle,
    this.hoverTextStyle,
  }) : super(key: key);

  @override
  _ButtonHoverState createState() => _ButtonHoverState();
}

class _ButtonHoverState extends State<ButtonHover> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = widget.textStyle ?? TextStyle(color: Colors.white);
    if (_isHovering) {
      textStyle =
          widget.hoverTextStyle ?? TextStyle(color: Colors.blue.shade200);
    }

    return InkWell(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: widget.onTap,
      onHover: (value) {
        setState(() {
          _isHovering = value;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: textStyle,
          ),
          if (widget.showUnderline)
            Wrap(
              direction: Axis.vertical,
              children: [
                SizedBox(
                  height: 5,
                ),
                Visibility(
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  visible: _isHovering,
                  child: Container(
                    height: 2,
                    width: 20,
                    color: Colors.white,
                  ),
                )
              ],
            )
          else
            Container()
        ],
      ),
    );
  }
}
