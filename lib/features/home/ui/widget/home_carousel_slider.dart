import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatelessWidget {
  const HomeCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 200, viewportFraction: 0.95),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 2.0),
              decoration: BoxDecoration(
                  color: AppColors.themeColor,
                  borderRadius: BorderRadius.circular(8)),
              alignment: Alignment.center,
              child: Text(
                'text $i',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
