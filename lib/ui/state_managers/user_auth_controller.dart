
import 'dart:async';

import 'package:flutter/foundation.dart';

import '/data/service/network_service.dart';
import '/ui/state_managers/auth_controller.dart';
import '/ui/state_managers/user_profile_controller.dart';
import 'package:get/get.dart';

class UserAuthController extends GetxController {


  bool _emailVerificationInProgress = false;
  bool _otpVerificationInProgress = false;

  bool get emailVerificationInProgress => _emailVerificationInProgress;

  bool get otpVerificationInProgress => _otpVerificationInProgress;

  late Timer timer;
  int secondCount = 120;


  Future<bool> emailVerification(String emailId) async {
    _emailVerificationInProgress = true;
    update();
    final response = await NetworkService.getData(url: '/UserLogin/$emailId');
    _emailVerificationInProgress = false;
    if (response.isSuccess) {
      update();
      if (kDebugMode) {
        print('status code ${response.statusCode}');
      }
      if (kDebugMode) {
        print('data code ${response.returnData}');
      }
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> otpVerification(String emailId, String otp) async {
    _otpVerificationInProgress = true;
    update();
   // print('EmailId $emailId');
    final response = await NetworkService.getData(
        url: "/VerifyLogin/$emailId/$otp");
    _otpVerificationInProgress = false;
   //print(response.returnData['data'].toString()) ;
    if (response.isSuccess) {
      await Get.find<AuthController>().saveToken(response.returnData['data']);
       Get.find<UserProfileController>().getProfileData();
      update();
      return true;
    } else {
      update();
      return false;
    }
  }



  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer =  Timer.periodic(
      oneSec,
          (Timer timer) {
        if (secondCount == 0) {
            timer.cancel();

        } else {
          secondCount--;
          update();

        }
      },
    );
  }
  void restartTimer() {
    secondCount=120;

    const oneSec = Duration(seconds: 1);
    timer =  Timer.periodic(
      oneSec,
          (Timer timer) {
        if (secondCount == 0) {
          timer.cancel();

        } else {
          secondCount--;
          update();
        }
      },
    );
  }

}