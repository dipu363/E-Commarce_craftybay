import '/data/model/category_model.dart';

import '/data/service/network_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{

  bool _categoryInProgress= false;
  bool get categoryInProgress => _categoryInProgress;

  CategoryModel _categoryModel = CategoryModel() ; // create instance of model
  CategoryModel get categoryModel => _categoryModel ;  // create getter method
  Future<bool> getCategory()async {
    _categoryInProgress = true;
    update();
    final response = await NetworkService.getData(url: '/CategoryList');
    if ( response.isSuccess){
      _categoryInProgress = false;
      _categoryModel = CategoryModel.fromJson(response.returnData);
      update();
      return true;
    }else{
      _categoryInProgress = false;
      update();
      return false;

    }

  }



}