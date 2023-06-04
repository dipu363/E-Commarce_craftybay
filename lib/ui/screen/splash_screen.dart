
import 'dart:developer';

import 'package:craftybay/ui/screen/bottom_nav_bar_screen.dart';
import 'package:craftybay/ui/screen/email_verification_screen.dart';
import 'package:craftybay/ui/state_managers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {

    super.initState();

    Future.delayed(const Duration(seconds: 1)).then((value)async {
      final bool loginState= await Get.find<AuthController>().isLoggedIn();
      log(loginState.toString());
      if (loginState){
        Get.offAll(BottomNavBarScreen());
      }else{
        Get.offAll((const EmailVerificationScreen()));
      }


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
                child: Image.asset('assets/images/logo.png',width: 110,)
            )
          ) ,
          const Column(
            children: [
              CircularProgressIndicator(color: primaryColor,),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Version 1.0',style: TextStyle(
                    fontSize: 12,
                    color: grayColor,
                    letterSpacing: 0.6
                 ),
                ),
              ),

            ],
          )



        ],
      ),
    );
  }
}
