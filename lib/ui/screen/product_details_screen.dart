import 'package:craftybay/ui/screen/product_review_screen.dart';
import 'package:craftybay/ui/screen/wish_list_screen.dart';
import 'package:get/get.dart';

import '/ui/widget/common_elevated_button.dart';

import '/ui/widget/product_details/product_image_carousel_widget.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widget/product_details/product_stepper_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colors = const [
    Color(0xFF000000),
    Color(0xFFFF0202),
    Color(0xFFE100D2),
    Color(0xFF0001FF),
    Color(0xFFFDE200),
    Color(0xFF5BBE00),
  ];

  List<String> size = [
    'S',
    'M',
    'L',
    'XL',
    '2L',
  ];

  Color selectedColor = const Color(0xFF000000);
  String selectedSize = 'S';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Product Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCarousel(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Nick Shoes E7347a',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: blackColor),
                                  ),
                                  Row(
                                    children: [
                                      Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.amberAccent,
                                          ),
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(width: 8),
                                      TextButton(
                                        onPressed: () {
                                          Get.to(const ProductReviewScreen());
                                        },
                                        child: const Text('Reviews'),
                                      ),
                                      const SizedBox(width: 8),
                                      InkWell(
                                        onTap: (){
                                          Get.to(const WishListScreen());
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const ProductStepper(),
                          ],
                        ),
                        const Text(
                          'Colors',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: blackColor),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: colors.map((color) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                onTap: () {
                                  if (selectedColor != color) {
                                    selectedColor = color;
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  }
                                },
                                child: CircleAvatar(
                                  backgroundColor: color,
                                  radius: 15,
                                  child: Visibility(
                                    visible: color == selectedColor,
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Size',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: blackColor),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: size.map((size) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  selectedSize = size;
                                  if (mounted) {
                                    setState(() {});
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: primaryColor),
                                      borderRadius: BorderRadius.circular(16)),
                                  child: CircleAvatar(
                                    backgroundColor: size == selectedSize
                                        ? primaryColor
                                        : Colors.white,
                                    radius: 15,
                                    child: Text(
                                      size,
                                      style: const TextStyle(
                                          fontSize: 14, color: blackColor),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Description',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: blackColor),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          'Our rewording tool is free and easy to use—with just the click of a button, the paraphrasing tool will rephrase your sentence, paragraph, essay, or article to your liking, with many options available to customize and perfect the reworded text.',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: grayColor),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                )),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: blackColor),
                      ),
                      Text(
                        '\$1000',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 140,
                    child: CommonElevatedButton(
                        title: 'Add to Cart', onTap: () {}),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
