import 'package:ecomerce/app/app_colors.dart';
import 'package:ecomerce/features/review/ui/screens/create_review_screen.dart';
import 'package:ecomerce/features/review/ui/widget/review_card_list_widget.dart';
import 'package:flutter/material.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({super.key});

  static const String name = '/review';
  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: 4,
              itemBuilder: (context, index) {
                return const ReviewCardListWidget();
              },
            ),
          ),
          _buildAddReviewsSection(),
        ],
      ),
    );
  }

  Widget _buildAddReviewsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Text(
                'Reviews',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 8),
              Text(
                '(1000)',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              )
            ],
          ),
          FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: AppColors.themeColor,
            foregroundColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, CreateReviewScreen.name);
            },
            child: const Icon(Icons.add),
          ),

        ],
      ),
    );
  }
}
