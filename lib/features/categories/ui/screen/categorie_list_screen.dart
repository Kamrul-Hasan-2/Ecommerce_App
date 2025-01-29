import 'package:ecomerce/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecomerce/features/common/ui/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorieListScreen extends StatelessWidget {
  const CategorieListScreen({super.key});

  static const String name = '/categorie-list-screen';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __)=>_onPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Category list'),
          leading: IconButton(
              onPressed: () {
                _onPop();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, mainAxisSpacing: 16, crossAxisSpacing: 8),
          itemCount: 20,
          itemBuilder: (context, index) {
            return const FittedBox(child: CategoryItemWidget());
          },
        ),
      ),
    );
  }
  void _onPop(){
    Get.find<MainBottomNavController>().backToHome();
  }
}

