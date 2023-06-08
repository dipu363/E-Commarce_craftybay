import 'package:craftybay/data/model/product.dart';

class ProductByCategoryModel {
  String? msg;
  List<Product>? product;

  ProductByCategoryModel({this.msg, this.product});

  ProductByCategoryModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      product = <Product>[];
      json['data'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (product != null) {
      data['data'] = product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

