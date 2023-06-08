import '/data/model/product_remark_model.dart';
import '/data/service/network_service.dart';
import 'package:get/get.dart';

class SpecialProductByRemarkController extends GetxController {

  bool _specialProductRemarkInProgress = false;
  bool get specialProductRemarkInProgress => _specialProductRemarkInProgress;

  ProductRemarkModel _specialProducts = ProductRemarkModel();
  ProductRemarkModel get specialProducts => _specialProducts;

  Future<bool> getSpecialProductByRemark() async {
    _specialProductRemarkInProgress = true;
    update();
    final response =
    await NetworkService.getData(url: '/ListProductByRemark/special');

    if (response.isSuccess) {
      _specialProducts = ProductRemarkModel.fromJson(response.returnData);
      _specialProductRemarkInProgress = false;
      update();
      return true;
    } else {
      _specialProductRemarkInProgress = false;
      update();
      return false;
    }
  }
}
