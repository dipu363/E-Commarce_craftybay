
import '/ui/screen/profile_screen.dart';
import '/ui/state_managers/auth_controller.dart';
import '/ui/state_managers/home_controller.dart';
import '/ui/state_managers/new_product_controller.dart';
import '/ui/state_managers/popular_product_controller.dart';
import '/ui/state_managers/special_product_controller.dart';

import '../screen/email_verification_screen.dart';
import '../screen/product_list_screen.dart';
import '../state_managers/buttom_nav_bar_controller.dart';

import '../state_managers/category_controller.dart';
import '../widget/caregoty_card_widget.dart';
import '../widget/product_card_widget.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/home/app_bar_icon_boutton.dart';
import '../widget/home/home_carosel.dart';
import '../widget/home/marker_title.dart';
import '../widget/home/search_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/logo_nav.png'),
            const Spacer(),
            AppBarIconButton(iconData: Icons.person_outline, onTap: () async{
              await Get.find<AuthController>().isLoggedIn().then((value)=>{

             if (value){
               Get.to(const ProfileScreen())
             }else{
               Get.to(const EmailVerificationScreen())
             }

              });


            }),
            AppBarIconButton(iconData: Icons.call_outlined, onTap: () {}),
            AppBarIconButton(
                iconData: Icons.notifications_outlined, onTap: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                const  SearchTextField(),
                const SizedBox(height: 16),
                GetBuilder<HomeController>(
                  builder: (homeController) {
                    if (homeController.sliderDataInProgress){
                      return const SizedBox(
                        height: 100,
                          child:  CircularProgressIndicator());
                    }else {

                      return HomeCarouselWidget(productSliderModel: homeController.productSliderModel,);
                    }
                  }
                ),
                const SizedBox(height: 8),
                 MarkerTitleWidget(
                  title: 'All Categories',
                  onTap: (){
                    Get.find<BottomNabBarController>().changeIndex(1);
                  },
                ),
                const SizedBox(height: 8),
                 GetBuilder<CategoryController>(

                   builder: (categoryController) {

                     if(categoryController.categoryInProgress){
                       return const SizedBox(
                         height: 100,
                         child: CircularProgressIndicator(),
                       );
                     }
                     return SingleChildScrollView(
                       scrollDirection: Axis.horizontal,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children:  categoryController.categoryModel.categories!.map((e) =>
                             CategoryCardWidget(name: e.categoryName.toString(),imageUrl: e.categoryImg.toString(),)
                            // Text(e.categoryName.toString()),

                         ).toList(),
                       ),
                     );
                   }
                 ),
                const SizedBox(height: 8),
                 MarkerTitleWidget(
                  title: 'Popular',
                   onTap: (){
                     Get.to(const ProductListScreen());
                   },
                ),
                const SizedBox(height: 8),
                GetBuilder<PopularProductByRemarkController>(

                    builder: (popularProductByRemarkController) {

                      if(popularProductByRemarkController.popularProductRemarkInProgress){
                        return const SizedBox(
                          height: 100,
                          child: CircularProgressIndicator(),
                        );
                      }
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  popularProductByRemarkController.popularProducts.product!.map((product) => ProductCardWidget(
                                product: product,
                              )

                          ).toList(),
                        ),
                      );
                    }
                ),
                const SizedBox(height: 8),
                 MarkerTitleWidget(
                   title: 'Spacial',
                   onTap: (){
                     Get.to(const ProductListScreen());
                   },
                 ),
                const SizedBox(height: 8),

                GetBuilder<SpecialProductByRemarkController>(

                    builder: (specialProductByRemarkController) {

                      if(specialProductByRemarkController.specialProductRemarkInProgress){
                        return const SizedBox(
                          height: 100,
                          child: CircularProgressIndicator(),
                        );
                      }
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  specialProductByRemarkController.specialProducts.product!.map((product) => ProductCardWidget(
                            product: product,
                          )

                          ).toList(),
                        ),
                      );
                    }
                ),
                const SizedBox(height: 8),
                 MarkerTitleWidget(
                   title: 'New',
                   onTap: (){
                     Get.to(const ProductListScreen());
                   },
                 ),
                const SizedBox(height: 8),


                GetBuilder<NewProductByRemarkController>(

                    builder: (newProductByRemarkController) {

                      if(newProductByRemarkController.newProductRemarkInProgress){
                        return const SizedBox(
                          height: 100,
                          child: CircularProgressIndicator(),
                        );
                      }
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  newProductByRemarkController.newProducts.product!.map((product) => ProductCardWidget(
                            product: product,
                          )

                          ).toList(),
                        ),
                      );
                    }
                ),
          ],
          ),
        ),
      ),
    );
  }
}





