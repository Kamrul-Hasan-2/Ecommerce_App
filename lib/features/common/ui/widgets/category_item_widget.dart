import 'package:ecomerce/app/app_colors.dart';
import 'package:ecomerce/features/common/ui/widgets/product_list_widget.dart';
import 'package:ecomerce/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListScreen.name, arguments: 'Computer');
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.14),
                borderRadius: BorderRadius.circular(4)),
            child: const Icon(
              Icons.computer,
              size: 36,
              color: AppColors.themeColor,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            'Computer',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.themeColor,
              letterSpacing: 1,
            ),
          )
        ],
      ),
    );
  }
}
