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
 int _selected_screen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value ){
          print('value = $value');
          _selected_screen = value;
          if(mounted){
            setState(() {});
          }
        },
        elevation: 10,
        currentIndex: _selected_screen,
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
      ),


      body: _screens[_selected_screen],
    );
  }
}
