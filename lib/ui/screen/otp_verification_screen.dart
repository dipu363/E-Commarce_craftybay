import 'package:craftybay/ui/screen/complete_profile_screen.dart';
import 'package:craftybay/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/style.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Center(
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
                'Enter OTP Code',
                style: titleTextStyle,
              ),
              const SizedBox(height: 4),
              Text('A 4 digit OTP Code has been sent',
                  style: subtitleTextStyle),
              const SizedBox(height: 24),
              PinCodeTextField(
                controller: TextEditingController(),
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
                onCompleted: (v) {},
                onChanged: (value) {},
                appContext: context,
              ),
              const SizedBox(height: 8),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const CompleteProfileScreen());
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
                    children: const [
                      TextSpan(
                          text: '120s', style: TextStyle(color: primaryColor))
                    ]),
              ),
              const SizedBox(height: 8),
              TextButton(onPressed: () {

              }, child: const Text('Resend Code'))
            ],
          ),
        ),
      ),
    );
  }
}
