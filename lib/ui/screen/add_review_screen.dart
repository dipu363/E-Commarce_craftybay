import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../widget/common_edittext_field.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({Key? key}) : super(key: key);

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },),
        title: const Text('Create Reviews'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CommonEditTextField(
            controller:TextEditingController(),
            validator: (String ? value ) {  },
              hintext: 'First Name',
            ),
            const SizedBox(
              height: 16,
            ),
            CommonEditTextField(
            controller:TextEditingController(),
            validator: (String ? value ) {  },
              hintext: 'List Name',
            ),
            const SizedBox(height: 16),
            TextFormField(

              controller: TextEditingController(),
              keyboardType: TextInputType.multiline,
              maxLines: 8,
              decoration: const InputDecoration(
                  hintText: 'Write Review',
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  border:  OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2)),
                  enabledBorder:  OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2))),

            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){}, child: const Text('Submit'),),),

          ],

        ),
      ),
    );
  }
}
