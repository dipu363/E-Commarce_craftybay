import 'package:craftybay/data/model/product_slider_model.dart';

import '/data/service/network_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  
   bool _sliderDataInProgress= false;
   bool get sliderDataInProgress => _sliderDataInProgress;

   ProductSliderModel _productSliderModel = ProductSliderModel() ; // create instance of model
   ProductSliderModel get productSliderModel => _productSliderModel ;  // create getter method
  Future<bool> getSliderData()async {
    _sliderDataInProgress = true;
    update();
    final response = await NetworkService.getData(url: '/ListProductSlider');
    if ( response.isSuccess){
      _sliderDataInProgress = false;

      //print(response.returnData.toString());
      _productSliderModel = ProductSliderModel.fromJson(response.returnData);
      update();
      return true;
    }else{
      _sliderDataInProgress = false;
      update();
      return false;

    }
    
}
  
  
  
}