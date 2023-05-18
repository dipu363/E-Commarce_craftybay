import '/ui/state_managers/buttom_nav_bar_controller.dart';
import 'package:get/get.dart';
import '/ui/screen/cart_screen.dart';
import '/ui/screen/home_screen.dart';
import '/ui/screen/wish_list_screen.dart';
import '/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

import 'category_screen.dart';

class BottomNavBarScreen extends StatelessWidget {
   BottomNavBarScreen({Key? key}) : super(key: key);

  final BottomNabBarController _bottomNabBarController = Get.put(BottomNabBarController());

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishListScreen()
  ];

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
