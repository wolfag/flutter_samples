import 'package:explore/core/widgets/my_app_bar/my_app_bar.dart';
import 'package:explore/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.4
        ? _scrollPosition / (screenSize.height * 0.4)
        : 1;
    bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      // appBar: isMobile
      //     ? PreferredSize(
      //         child: MyAppBarMobile(
      //           opacity: _opacity,
      //         ),
      //         preferredSize: Size.fromHeight(AppBar().preferredSize.height))
      //     : PreferredSize(
      //         child: MyAppBarTablet(opacity: _opacity),
      //         preferredSize: Size.fromHeight(1000),
      //       ),
      appBar: MyAppBar(
        opacicy: _opacity,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: SizedBox(
                    height: screenSize.height * 0.45,
                    width: screenSize.width,
                    child: Image.asset(
                      'assets/images/cover.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    FloatingQuickAccessBar(),
                    Container(
                      child: Column(
                        children: [
                          FeatureHeading(),
                          FeatureTitles(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            DestinationHeading(),
            DestinationCarousel(),
            SizedBox(height: screenSize.height / 10),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
