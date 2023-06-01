
import '../state_managers/user_auth_controller.dart';
import '/ui/screen/otp_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../utils/style.dart';

import '../widget/common_edittext_field.dart';
import '../widget/common_elevated_button.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  TextEditingController emailVerifyController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserAuthController>(
        builder: (authController) {
          return Padding(
            padding: const EdgeInsets.all(36.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 80,
                      width: 80,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Welcom Back',
                      style: titleTextStyle,
                    ),
                    const SizedBox(height: 4),
                    Text('Please Enter your email address', style: subtitleTextStyle),
                    const SizedBox(height: 24),
                    CommonEditTextField(
                      controller: emailVerifyController,
                      validator: (String? value) {
                        if(value?.isEmpty?? true){
                          return 'Please Enter Valid Email Address';
                        }else{
                          return null;
                        }
                      },
                      hintext: 'Email Address',
                    ),
                    const SizedBox(height: 16),
                    authController.emailVerificationInProgress? const CircularProgressIndicator():CommonElevatedButton(
                        title: 'Next',
                        onTap: ()async {
                          if(_formKey.currentState!.validate()) {
                            final bool response = await authController
                                .emailVerification(emailVerifyController.text);

                            if (response) {
                              Get.to(OtpVerificationScreen(email: emailVerifyController.text,));
                              emailVerifyController.text = '';
                            } else {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text(
                                        'Email Verification failed ')));
                              }
                            }
                          }
                    }),



                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}






