import 'package:ecomerce/app/app_colors.dart';
import 'package:ecomerce/app/assets_path.dart';
import 'package:ecomerce/features/common/ui/widgets/product_quantity_inc_dec_button.dart';
import 'package:flutter/material.dart';

class CartProductItemWidget extends StatelessWidget {
  const CartProductItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      color: Colors.white,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        child: Row(
          children: [
            Image.asset(
              AssetsPath.dummyImageShoePng,
              width: 90,
              height: 90,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Nike Shoe - AK4552 New Year speacial offer',
                              maxLines: 1,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Text('Color : Red'),
                                SizedBox(width: 8),
                                Text('Size : XL')
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.delete_outline))
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('\$100', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.themeColor,
                          fontSize: 16
                      ),),
                      ProductQuantityIncDecButton(
                          onChange: (int onChangeItem) {})
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
