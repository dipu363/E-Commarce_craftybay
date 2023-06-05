import 'package:craftybay/ui/screen/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'package:get/get.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key, required this.name, required this.imageUrl,
  });

  final String  name ,imageUrl;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(const ProductListScreen());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(.1),
                  borderRadius: BorderRadius.circular(8)
              ),
              child:  Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(imageUrl,height: 30,),
              ),

            ),
            const SizedBox(height: 8),
            Text(name,textAlign: TextAlign.center,style: const TextStyle( fontWeight: FontWeight.w600,color: primaryColor,letterSpacing: 0.6,))
          ],
        ),
      ),
    );
  }
}