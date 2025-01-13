import 'package:ecomerce/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (bottomNavController) {
        return Scaffold(
          bottomNavigationBar: NavigationBar(
            selectedIndex: bottomNavController.selectedIndex,
            onDestinationSelected: (value) => bottomNavController.changeIndex,
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
