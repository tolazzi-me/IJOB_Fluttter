import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Carousel extends StatelessWidget {
  final List<String> assets;
  const Carousel({Key? key, required this.assets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        // disableCenter: true,
        aspectRatio: 16 / 12,
        viewportFraction: 1,
      ),
      itemCount: assets.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        final image = assets[itemIndex];
        return SizedBox(
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          width: Get.width,
        );
      },
    );
  }
}
