
import 'dart:async';
import 'dart:developer';

import 'package:craftybay/data/service/network_service.dart';
import 'package:craftybay/ui/state_managers/auth_controller.dart';
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
      print('status code ${response.statusCode}');
      print('data code ${response.returnData}');
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> otpVerification(String emailId, String otp) async {
    _otpVerificationInProgress = true;
    update();
    print('EmailId $emailId');
    final response = await NetworkService.getData(
        url: "/VerifyLogin/$emailId/$otp");
    _otpVerificationInProgress = false;
    if (response.isSuccess) {
      await Get.find<AuthController>().saveToken(response.returnData['data']);
      update();
      log('status code ${response.statusCode}');
      log('data code ${response.returnData.toString()}');
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