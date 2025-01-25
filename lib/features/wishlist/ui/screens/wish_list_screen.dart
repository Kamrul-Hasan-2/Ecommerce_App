import 'package:ecomerce/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecomerce/features/common/ui/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __)=>_onPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Wish List'),
          leading: IconButton(
              onPressed: () =>_onPop,
              icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: GridView.builder(
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            childAspectRatio: 0.8,
            crossAxisSpacing: 2,
          ),
          itemBuilder: (context, index) {
            return const FittedBox(child: ProductItemWidget());
          },
        ),
      ),
    );
  }
  void _onPop(){
    Get.find<MainBottomNavController>().backToHome();
  }
}
