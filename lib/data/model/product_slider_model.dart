import '/data/model/slider_data.dart';

class ProductSliderModel {
  String? msg;
  List<SliderData>? sliderData;

  ProductSliderModel({this.msg, this.sliderData});

  ProductSliderModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      sliderData = <SliderData>[];
      json['data'].forEach((v) {
        sliderData!.add(SliderData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (sliderData != null) {
      data['data'] = sliderData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
