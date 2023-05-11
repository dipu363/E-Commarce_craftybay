
import 'package:flutter/material.dart';

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
                'Welcom Back',
                style: titleTextStyle,
              ),
              const SizedBox(height: 4),
              Text('Please Enter your email address', style: subtitleTextStyle),
              const SizedBox(height: 24),
              CommonEditTextField(
                controller: TextEditingController(),
                validator: (String? value) {},
                hintext: 'Email Address',
              ),
              const SizedBox(height: 16),
              CommonElevatedButton(title: 'Next', onTap: () {  },)
            ],
          ),
        ),
      ),
    );
  }
}






