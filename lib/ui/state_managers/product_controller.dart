import 'package:craftybay/data/model/product_by_category_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/service/network_service.dart';

class ProductController extends GetxController {



  bool _productByCategoryInProgress = false;
  bool get productByCategoryInProgress => _productByCategoryInProgress;

  ProductByCategoryModel _productByCategoryModel = ProductByCategoryModel();
  ProductByCategoryModel get productByCategoryModel => _productByCategoryModel;


  Future<bool> getProductByCategory(int categoryId) async {
    _productByCategoryInProgress = true;
    update();
    final response =
    await NetworkService.getData(url: '/ListProductByCategory/$categoryId');

    if (response.isSuccess) {
      _productByCategoryInProgress = false;
      _productByCategoryModel = ProductByCategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      _productByCategoryInProgress = false;
      update();
      return false;
    }
  }
}