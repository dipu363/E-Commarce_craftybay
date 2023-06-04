import 'package:craftybay/data/model/profile_data.dart';

class ProfileModel {
  String? msg;
  List<ProfileData>? data;

  ProfileModel({this.msg, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ProfileData>[];
      json['data'].forEach((v) {
        data!.add(ProfileData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


