import 'package:ecomerce/app/app_colors.dart';
import 'package:ecomerce/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name, arguments: 1);
      },
      child: SizedBox(
        width: 140,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
          ),
          color: Colors.white,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.themeColor.withOpacity(0.14),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8))),
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  'assets/images/shoe.png',
                  width: 140,
                  height: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Nike shoe latest model - NK45l',
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black54,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('\$100', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.themeColor
                        ),),
                        const Wrap(
                          children: [
                            Icon(Icons.star,color: Colors.amber,size: 20,),
                            Text('4.5', style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.themeColor
                            ),),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration:  BoxDecoration(
                            color: AppColors.themeColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(Icons.favorite_border, size: 16,color: Colors.white,),
                        )
                      ],
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
