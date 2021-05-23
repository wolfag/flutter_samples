import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DestinationCarousel extends StatefulWidget {
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  int _currentIndex = 0;

  final List<String> images = [
    'assets/images/asia.jpg',
    'assets/images/africa.jpg',
    'assets/images/europe.jpg',
    'assets/images/south_america.jpg',
    'assets/images/australia.jpg',
    'assets/images/antarctica.jpg',
  ];

  final List<String> places = [
    'ASIA',
    'AFRICA',
    'EUROPE',
    'SOUTH AMERICA',
    'AUSTRALIA',
    'ANTARCTICA',
  ];

  List<Widget> generateImageTiles() {
    return images
        .map(
          (index) => ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              index,
              fit: BoxFit.cover,
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        CarouselSlider(
          items: generateImageTiles(),
          options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 18 / 8,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
        ),
        AspectRatio(
          aspectRatio: 18 / 8,
          child: Center(
            child: Text(
              places[_currentIndex],
              style: TextStyle(
                letterSpacing: 8,
                fontSize: screenSize.width / 25,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
