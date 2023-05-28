
import 'package:craftybay/ui/screen/add_review_screen.dart';
import 'package:craftybay/ui/utils/app_colors.dart';
import 'package:craftybay/ui/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/common_elevated_button.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },),
        title: const Text('Reviews'),
      ),
      
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding:  EdgeInsets.only(left: 8.0,right: 8,top: 4,bottom: 4),
                    child:  ReviewsItemsWidget(),
                  );
                },


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
                  Row(
                    children: const [
                      Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: blackColor),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        '(100)',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                    ],
                  ),

                  
                  
                 FloatingActionButton(
                   elevation: 5,
                   backgroundColor: primaryColor,
                     onPressed: (){
                     Get.to(const AddReviewScreen());

                     },
                   child: const Icon(Icons.add,size: 20,),



                 )
                 /* SizedBox(
                    width: 140,
                    child: CommonElevatedButton(
                        title: 'Add to Cart', onTap: () {}),
                  )*/
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ReviewsItemsWidget extends StatelessWidget {
  const ReviewsItemsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                 CircleAvatar(
                  backgroundColor: graySoftColor.withOpacity(0.4),
                  child: const Icon(Icons.person_outline,color: Colors.black,)
                ),
                 Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text('Dipu',style:titleTextStyle.copyWith(fontSize: 20)),),

              ],
            ),
            const SizedBox(height: 16,),
            Text('This example continues to build from our the previous ones, creating a similar list using ListView.separated. Here, a Divider is used as a separator.',style: subtitleTextStyle,)
          ],
        ),
      ),
    );
  }
}
