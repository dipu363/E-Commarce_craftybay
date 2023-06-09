import 'package:craftybay/ui/screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/product.dart';
import '../utils/app_colors.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key, required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: InkWell(
        onTap: (){
          Get.to(const ProductDetailsScreen());
        },
        child: Card(
          elevation: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                product.image!,
                width: 140,
                height: 100,
                fit: BoxFit.scaleDown,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                     Text(
                      product.title??'unknown',
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: grayColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Text(
                            '\$${product.price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                                fontSize: 14),
                          ),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children:  [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.amberAccent,
                              ),
                              Text(
                               '${product.star ?? 0}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(width: 4),
                          Container(
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(2)),
                            child:const Padding(
                              padding:  EdgeInsets.all(2.0),
                              child:  Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
