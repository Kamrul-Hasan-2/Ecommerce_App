import 'package:ecomerce/app/assets_path.dart';
import 'package:ecomerce/features/home/ui/widget/app_bar_icon_button.dart';
import 'package:ecomerce/features/home/ui/widget/category_item_widget.dart';
import 'package:ecomerce/features/home/ui/widget/home_carousel_slider.dart';
import 'package:ecomerce/features/home/ui/widget/home_section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                const HomeCarouselSlider(),
                const SizedBox(height: 8),
                HomeSectionHeader(
                  title: 'All Categories',
                  onTap: () {},
                ),
                const SizedBox(
                  height: 8,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getCategoriesList(),
                  ),
                ),

                //TODO : 23 min
              ],
            ),
          ),
        ));
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
