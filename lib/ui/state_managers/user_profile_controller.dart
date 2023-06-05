import 'dart:developer';

import '/data/model/profile_model.dart';
import '/ui/state_managers/auth_controller.dart';
import 'package:get/get.dart';

import '../../data/service/network_service.dart';

class UserProfileController extends GetxController{

  bool _userProfileDataInProgress = false;
  bool get userProfileDataInProgress => _userProfileDataInProgress;


  Future<bool> getProfileData() async {
    _userProfileDataInProgress = true;
    update();
    final response = await NetworkService.getData(url: '/ReadProfile');
    _userProfileDataInProgress = false;
    if (response.isSuccess) {
      final ProfileModel profileModel = ProfileModel.fromJson(response.returnData);

      if(profileModel.data != null) {
        Get.find<AuthController>().saveProfileData(profileModel.data!.first);
      }else{
        // Get.to(CreateProfileScreen)
      }
      update();
      log('status code ${response.statusCode}');
      log('data code ${response.returnData}');
      return true;
    } else {
      update();
      return false;
    }
  }
}