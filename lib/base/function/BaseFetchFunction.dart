import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../network/ProductCategoryResponse.dart';
import '../model/BaseResponseModel.dart';

/// fetch Data from url API
Future<T?> fetchDataModel<T>(String url) async {
  /*try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      BaseResponseModel<T> responseModel = BaseResponseModel<T>.fromJson(jsonDecode(response.body));
      if (responseModel.status == 200){
        /// Call API success
        return responseModel.data;
      }
    }
  } catch (error) {
    log('data: $error');
  }*/
  /// Call API failed
  return null;
}

/// fetch Data from url API
Future<T?> fetchDataList<T>(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      //BaseResponseModel<T> responseModel = BaseResponseModel<T>().fromJson(jsonDecode(response.body));
      BaseResponseModel responseModel = ProductCategoryResponse().fromJson(jsonDecode(response.body));
      if (responseModel.status == 200){
        /// Call API success
        return responseModel.result;
      }
    }
  } catch (error) {
    log('data: $error');
  }
  /// Call API failed
  return null;
}
