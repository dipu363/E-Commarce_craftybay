

import '/ui/state_managers/buttom_nav_bar_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  GetBuilder<BottomNabBarController>(

            builder: (controller) {
              return IconButton(onPressed: () {
                controller.backHome();
              },
                icon: const Icon(Icons.arrow_back_ios),);
            }
        ),
        title: const Text('Product'),

      ),

      body: GridView.builder(
          itemCount: 50,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
            childAspectRatio: .7
      ),
          itemBuilder: (context,index){
            const Text('null');
           // return const ProductCardWidget();

      }),
    );
  }
}
