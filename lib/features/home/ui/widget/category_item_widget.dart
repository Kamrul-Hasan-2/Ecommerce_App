import 'package:ecomerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.1),
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
    );
  }
}
