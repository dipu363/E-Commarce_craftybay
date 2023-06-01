
import 'package:craftybay/ui/screen/home_screen.dart';
import 'package:craftybay/ui/state_managers/user_auth_controller.dart';
import 'package:craftybay/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/style.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key, required this.email}) : super(key: key);

  final String email ;




  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  TextEditingController otpTextEditController = TextEditingController();

  UserAuthController userAuthController = Get.put(UserAuthController());

  @override
  void initState() {
    super.initState();

    userAuthController.startTimer();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Center(
          child: GetBuilder<UserAuthController>(
            builder: (uAuthController) {

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Enter OTP Code',
                    style: titleTextStyle,
                  ),
                  const SizedBox(height: 4),
                  Text('A 4 digit OTP Code has been sent',
                      style: subtitleTextStyle),
                  const SizedBox(height: 24),
                  PinCodeTextField(
                    controller: otpTextEditController,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      selectedColor: Colors.green,
                      activeColor: primaryColor,
                      inactiveColor: primaryColor,
                      inactiveFillColor: Colors.white,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {

                    },
                    onChanged: (value) {},
                    appContext: context,
                  ),
                  const SizedBox(height: 8),

                  uAuthController.otpVerificationInProgress? const CircularProgressIndicator():SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async{
                        final bool response = await uAuthController
                            .otpVerification( widget.email,otpTextEditController.text);

                        if (response) {
                          Get.to(const HomeScreen());
                          otpTextEditController.text = '';
                        } else {
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                    'OTP Verification failed ')));
                            otpTextEditController.text = '';
                          }
                        }

                      },
                      child: const Text('Next'),
                    ),
                  ),
                  // CommonElevatedButton(title: 'Next', onTap: () {}),
                  const SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                        text: 'This code will be expire in ',
                        style: subtitleTextStyle,
                        children:  [
                          TextSpan(
                              text:' ${uAuthController.secondCount.toString()} Second', style: const TextStyle(color: primaryColor))
                        ]),
                  ),
                  const SizedBox(height: 8),

                     TextButton(onPressed: () async{
                      final bool response = await uAuthController
                          .emailVerification(widget.email);
                      uAuthController.restartTimer();
                      if (response) {

                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text(
                                  'OTP Resend to Your Email address')));
                        }





                      }
                    },

                        child: const Text('Resend Code')),


                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
