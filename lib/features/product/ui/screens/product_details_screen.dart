import 'package:ecomerce/app/app_colors.dart';
import 'package:ecomerce/features/product/ui/widget/color_picker_widget.dart';
import 'package:ecomerce/features/product/ui/widget/product_image_carousel_slider.dart';
import 'package:ecomerce/features/product/ui/widget/product_quantity_inc_dec_button.dart';
import 'package:ecomerce/features/product/ui/widget/size_picker_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;
  static const name = '/product/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductImageCarouselSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'Nike Shoe A2ERF - New year special deal',
                                    style: textTheme.titleMedium,
                                  ),
                                  Row(
                                    children: [
                                      const Wrap(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 20,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text('Reviews')),
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: AppColors.themeColor,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Icon(
                                          Icons.favorite_border,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            ProductQuantityIncDecButton(
                              onChange: (int value) {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text('Color',
                            style: textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        ColorPickerWidget(
                          colors: const [
                            'Red',
                            'Green',
                            'Yellow',
                            'Pink',
                            'Black'
                          ],
                          onColorSelected: (String selectedColor) {},
                        ),
                        const SizedBox(height: 16),
                        Text('Size',
                            style: textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        SizePickerWidget(
                          sizes: const ['S', 'M', 'L', 'XL', 'XXL'],
                          onSizeSelected: (String selectedSize) {},
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Description',
                          style: textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam vehicula tellus odio, non iaculis magna interdum a. Etiam tristique posuere vehicula. Aenean sed velit in arcu imperdiet dapibus. Cras sit amet nunc a justo imperdiet hendrerit. Etiam aliquam purus sed gravida malesuada. Pellentesque ac augue elementum, dapibus turpis non, interdum nibh. Nulla et justo suscipit, dictum tellus a, vehicula est. Etiam quis tortor a nisl cursus commodo.  ''',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCartSection()
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.themeColor.withOpacity(0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            children: [
              Text(
                'Price',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              Text(
                '\$100',
                style: TextStyle(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              )
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
