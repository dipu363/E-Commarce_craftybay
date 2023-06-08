

import 'package:craftybay/ui/state_managers/home_controller.dart';
import 'package:craftybay/ui/state_managers/new_product_controller.dart';
import 'package:get/get.dart';
import '../state_managers/category_controller.dart';
import '../state_managers/popular_product_controller.dart';
import '../state_managers/special_product_controller.dart';
import '/ui/state_managers/buttom_nav_bar_controller.dart';
import '/ui/screen/cart_screen.dart';
import '/ui/screen/home_screen.dart';
import '/ui/screen/wish_list_screen.dart';
import '/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'category_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
   const BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishListScreen()
  ];

  @override
  void initState() {
    super.initState();

    Get.find<HomeController>().getSliderData();
    Get.find<CategoryController>().getCategory();
    Get.find<PopularProductByRemarkController>().getPopularProductByRemark();
    Get.find<SpecialProductByRemarkController>().getSpecialProductByRemark();
    Get.find<NewProductByRemarkController>().getNewProductByRemark();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<BottomNabBarController>(
        builder: (controller) {
          return BottomNavigationBar(
            onTap: (value ){
             controller.changeIndex(value);
            },
            elevation: 10,
            currentIndex: controller.selectedIndex,
            selectedItemColor: primaryColor,
            unselectedItemColor: grayColor,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            unselectedLabelStyle: const TextStyle(color: grayColor),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_outlined),
                label: 'Category'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart_outlined),
                label: 'Cart'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Wishlist'
              ),
            ],
          );
        }
      ),


      body: GetBuilder<BottomNabBarController>(
        builder: (controller) {
          return _screens[controller.selectedIndex];
        }
      )
    );
  }
}
