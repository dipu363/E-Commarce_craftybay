import 'package:craftybay/data/model/product_by_category_model.dart';
import '/data/service/network_service.dart';
import 'package:get/get.dart';

class PopularProductByRemarkController extends GetxController {
  bool _popularProductRemarkInProgress = false;
  bool get popularProductRemarkInProgress => _popularProductRemarkInProgress;

  ProductByCategoryModel _popularProducts = ProductByCategoryModel();
  ProductByCategoryModel get popularProducts => _popularProducts;

  Future<bool> getPopularProductByRemark() async {
    _popularProductRemarkInProgress = true;
    update();
    final response =
        await NetworkService.getData(url: '/ListProductByRemark/popular');

    if (response.isSuccess) {
      _popularProducts = ProductByCategoryModel.fromJson(response.returnData);
      _popularProductRemarkInProgress = false;
      update();
      return true;
    } else {
      _popularProductRemarkInProgress = false;
      update();
      return false;
    }
  }

}
