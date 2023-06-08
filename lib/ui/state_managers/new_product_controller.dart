import '/data/model/product_remark_model.dart';
import '/data/service/network_service.dart';
import 'package:get/get.dart';

class NewProductByRemarkController extends GetxController {

  bool _newProductRemarkInProgress = false;
  bool get newProductRemarkInProgress => _newProductRemarkInProgress;

  ProductRemarkModel _newProducts = ProductRemarkModel();
  ProductRemarkModel get newProducts => _newProducts;

  Future<bool> getNewProductByRemark() async {
    _newProductRemarkInProgress = true;
    update();
    final response =
    await NetworkService.getData(url: '/ListProductByRemark/new');

    if (response.isSuccess) {
      _newProducts = ProductRemarkModel.fromJson(response.returnData);
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
