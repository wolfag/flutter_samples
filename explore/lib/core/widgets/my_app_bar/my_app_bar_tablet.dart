import 'package:explore/core/widgets/button_hover.dart';
import 'package:flutter/material.dart';

class MyAppBarTablet extends StatelessWidget implements PreferredSizeWidget {
  final double opacity;

  const MyAppBarTablet({
    Key? key,
    required this.opacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: Colors.blueGrey.shade900.withOpacity(opacity),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ButtonHover(
                title: 'EXPLORE',
                showUnderline: false,
                onTap: () {},
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonHover(
                      title: 'Discover',
                      onTap: () {},
                    ),
                    SizedBox(
                      width: screenSize.width / 20,
                    ),
                    ButtonHover(
                      title: 'Contact Us',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              ButtonHover(
                title: 'Sign Up',
                onTap: () {},
              ),
              SizedBox(
                width: screenSize.width / 50,
              ),
              ButtonHover(
                title: 'Login',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(1000);
}
