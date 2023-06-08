import '../../data/model/product_by_category_model.dart';
import '/data/service/network_service.dart';
import 'package:get/get.dart';

class NewProductByRemarkController extends GetxController {

  bool _newProductRemarkInProgress = false;
  bool get newProductRemarkInProgress => _newProductRemarkInProgress;

  ProductByCategoryModel _newProducts = ProductByCategoryModel();
  ProductByCategoryModel get newProducts => _newProducts;

  Future<bool> getNewProductByRemark() async {
    _newProductRemarkInProgress = true;
    update();
    final response =
    await NetworkService.getData(url: '/ListProductByRemark/new');

    if (response.isSuccess) {
      _newProducts = ProductByCategoryModel.fromJson(response.returnData);
      _newProductRemarkInProgress = false;
      update();
      return true;
    } else {
      _newProductRemarkInProgress = false;
      update();
      return false;
    }
  }
}
