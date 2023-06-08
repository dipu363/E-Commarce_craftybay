

import '/ui/state_managers/product_controller.dart';
import '../widget/product_card_widget.dart';
import '/ui/state_managers/buttom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key, required this.categoryId,}) : super(key: key);

  final int categoryId ;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {


  @override
  void initState() {
    super.initState();
    Get.find<ProductController>().getProductByCategory(widget.categoryId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  GetBuilder<BottomNabBarController>(

            builder: (controller) {
              return IconButton(onPressed: () {
                Get.back();
              },
                icon: const Icon(Icons.arrow_back_ios),);
            }
        ),
        title: const Text('Product'),

      ),

      body: GetBuilder<ProductController>(
        builder: (productController) {

          if(productController.productByCategoryInProgress){
           return const Center(
              child:   CircularProgressIndicator(),
            );
          }else{

          }
          if(productController.productByCategoryModel.product!.isEmpty){
            return const GetSnackBar(
              title: 'Message',
              message: 'Product not found',
            );
          }
          return GridView.builder(
              itemCount: productController.productByCategoryModel.product!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: .7
              ),
              itemBuilder: (context,index){

                return ProductCardWidget(product: productController.productByCategoryModel.product![index]);

              });

        }
      ),
    );
  }
}
