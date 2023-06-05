
import 'package:craftybay/ui/state_managers/category_controller.dart';
import 'package:get/get.dart';
import '../state_managers/buttom_nav_bar_controller.dart';
import '/ui/widget/caregoty_card_widget.dart';
import 'package:flutter/material.dart';
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

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
        title: const Text('Category')

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<CategoryController>(

          builder: (categoryController) {

            if(categoryController.categoryInProgress){
              return const Center(
                child: SizedBox(height: 30,
                  child: CircularProgressIndicator()
                  ),
              );
            }
            

            return RefreshIndicator(
              onRefresh: ()async{
                Get.find<CategoryController>().getCategory();
              },
              child: GridView.builder(
                itemCount: categoryController.categoryModel.categories!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4
                  ),
                  itemBuilder: (context,index){
                  return CategoryCardWidget(name: categoryController.categoryModel.categories![index].categoryName.toString(),
                    imageUrl: categoryController.categoryModel.categories![index].categoryImg.toString());
                  }),
            );
          }
        ),
      ),


    );
  }
}
