import 'package:ecomerce/features/cart/ui/screens/cart_list_screen.dart';
import 'package:ecomerce/features/categories/ui/screen/categorie_list_screen.dart';
import 'package:ecomerce/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecomerce/features/home/ui/controller/slider_list_controller.dart';
import 'package:ecomerce/features/home/ui/screens/home_screen.dart';
import 'package:ecomerce/features/wishlist/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static const String name = '/main-bottom-nav';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CategorieListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    Get.find<SliderListController>().getSlider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (bottomNavController) {
        return Scaffold(
          body: _screens[bottomNavController.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: bottomNavController.selectedIndex,
            onDestinationSelected: bottomNavController.changeIndex,
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.category), label: 'Categories'),
              NavigationDestination(
                  icon: Icon(Icons.add_shopping_cart), label: 'Cart'),
              NavigationDestination(
                  icon: Icon(Icons.favorite_border), label: 'Wish'),
            ],
          ),
        );
      }
    );
  }
}
