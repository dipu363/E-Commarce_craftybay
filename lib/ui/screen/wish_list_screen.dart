
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_managers/buttom_nav_bar_controller.dart';
class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GetBuilder<BottomNabBarController>(

            builder: (controller) {
              return IconButton(onPressed: () {
                controller.backHome();
              }, icon: const Icon(Icons.arrow_back_ios),);
            }
        ),
        title: const Text('Wish List'),

      ),

      body: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            childAspectRatio: .71
          ),
          itemBuilder: (context,index){

            const Text('null');
           // return const ProductCardWidget();

          }),
    );
  }
}
