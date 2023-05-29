
import 'dart:convert';
import 'dart:developer';

import 'package:craftybay/data/model/response_model.dart';

import '/data/utils/urls.dart';
import 'package:http/http.dart';
class NetworkService{
  // it is Singleton design pattern
  // when we create a privet ( _ ) instance its call singleton class
  // any one can not create its instance
  NetworkService._();

  static Future<ResponseModel> getData({required String url}) async {
    try{
      final Response response = await get(Uri.parse(Urls.baseUrl + url));

      if (response.statusCode == 200) {
        return ResponseModel(
           isSuccess: true,
            statusCode: response.statusCode,
            returnData: jsonDecode(response.body),

        );
      } else {
        return ResponseModel(
          isSuccess: false,
          statusCode: response.statusCode,
          returnData: jsonDecode(response.body),

        );

      }
    }catch(e){
      log(e.toString());
      return ResponseModel(
        isSuccess: true,
        statusCode: -1,
        returnData: e.toString(),

      );
    }
  }
}