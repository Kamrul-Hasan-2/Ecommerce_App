import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarouselSlider extends StatefulWidget {
  const ProductImageCarouselSlider({
    super.key,
  });

  @override
  State<ProductImageCarouselSlider> createState() => _ProductImageCarouselSliderState();
}

class _ProductImageCarouselSliderState extends State<ProductImageCarouselSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 220, viewportFraction: 0.95, onPageChanged: (currentIndex, reason) => {
            _selectedIndex.value = currentIndex
          },),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      ),
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
        ),
        Positioned(
          bottom: 12,
          right: 0,
          left: 0,
          child: ValueListenableBuilder(
            valueListenable: _selectedIndex,
            builder: (BuildContext context, value, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i=0; i<5; i++)
                    Container(
                      width: 16,
                      height: 16,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: value == i ? AppColors.themeColor : Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
