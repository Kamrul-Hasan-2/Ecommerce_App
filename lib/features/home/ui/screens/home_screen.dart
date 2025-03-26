import 'package:ecomerce/app/assets_path.dart';
import 'package:ecomerce/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecomerce/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecomerce/features/home/ui/controller/slider_list_controller.dart';
import 'package:ecomerce/features/home/ui/widget/app_bar_icon_button.dart';
import 'package:ecomerce/features/common/ui/widgets/category_item_widget.dart';
import 'package:ecomerce/features/home/ui/widget/home_carousel_slider.dart';
import 'package:ecomerce/features/home/ui/widget/home_section_header.dart';
import 'package:ecomerce/features/common/ui/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../widget/product_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 16),
                ProductSearchBar(
                  controller: _searchTEController,
                ),
                const SizedBox(height: 16),
                GetBuilder<SliderListController>(
                    builder:(controller){
                      if(controller.inProgress){
                        return const SizedBox(
                          height: 180,
                          child: CenteredCircularProgressIndicator(),
                        );
                      }
                      return HomeCarouselSlider(
                        sliderList : controller.bannerList,
                      );
                    }
                ),
                const SizedBox(height: 8),
                HomeSectionHeader(
                  title: 'All Categories',
                  onTap: () {
                    Get.find<MainBottomNavController>().moveToCategory();
                  },
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getCategoriesList(),
                  ),
                ),
                const SizedBox(height: 16),
                HomeSectionHeader(title: 'Popular', onTap: () {}),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getProductList(),
                  ),
                ),
                const SizedBox(height: 16),
                HomeSectionHeader(title: 'Special', onTap: () {}),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getProductList(),
                  ),
                ),
                const SizedBox(height: 16),
                HomeSectionHeader(title: 'New', onTap: () {}),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getProductList(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  List<Widget> _getProductList() {
    List<Widget> productList = [];
    for (int i = 0; i < 10; i++) {
      productList.add(const Padding(
        padding: EdgeInsets.only(right: 16),
        child: ProductItemWidget(),
      ));
    }
    return productList;
  }

  List<Widget> _getCategoriesList() {
    List<Widget> categoriesList = [];
    for (int i = 0; i < 10; i++) {
      categoriesList.add(const Padding(
        padding: EdgeInsets.only(right: 16),
        child: CategoryItemWidget(),
      ));
    }
    return categoriesList;
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navAppLogoSvg),
      actions: [
        AppBarIconButton(
          onTap: () {},
          icon: Icons.person_2_outlined,
        ),
        const SizedBox(
          width: 6,
        ),
        AppBarIconButton(
          onTap: () {},
          icon: Icons.call,
        ),
        const SizedBox(
          width: 6,
        ),
        AppBarIconButton(
          onTap: () {},
          icon: Icons.notification_add_outlined,
        ),
      ],
    );
  }
}

