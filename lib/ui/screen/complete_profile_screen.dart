import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/style.dart';
import '../widget/common_edittext_field.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Image.asset(
                'assets/images/logo.png',
                height: 80,
                width: 80,
              ),

              const SizedBox(height: 8),
              Text(
                'Complete Profile',
                style: titleTextStyle,
              ),
              const SizedBox(height: 4),
              Text('get started with us with your details', style: subtitleTextStyle),
              const SizedBox(height: 24),
              CommonEditTextField(
                controller: TextEditingController(),
                validator: (String? value) {},
                hintext: 'First Name',
              ),
              const SizedBox(height: 16),
              CommonEditTextField(
                controller: TextEditingController(),
                validator: (String? value) {},
                hintext: 'Last Name',
              ),
              const SizedBox(height: 16),
              CommonEditTextField(
                controller: TextEditingController(),
                validator: (String? value) {},
                hintext: 'Mobile',
              ),
              const SizedBox(height: 16),
              CommonEditTextField(
                controller: TextEditingController(),
                validator: (String? value) {},
                hintext: 'City',
              ),
              const SizedBox(height: 16),
              TextFormField(

                controller: TextEditingController(),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: const InputDecoration(
                    hintText: 'Shipping Address',
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
                  child: ElevatedButton(onPressed: (){}, child: const Text('Next'),),),

            ],

          ),
        ),
      ),
    );
  }
}
