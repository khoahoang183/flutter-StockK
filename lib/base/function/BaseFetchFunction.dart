import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:stockk_flutter/model/ProductCategoryModel.dart';
import 'package:stockk_flutter/network/response/ProductCategoriesResponse.dart';

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
Future<List<ProductCategoryModel>> fetchDataList<T extends BaseResponseModel>(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var serverResponse = ProductCategoriesResponse().fromJson(jsonDecode(response.body));
      if (serverResponse.status == 200) {
        /// Call API success
        return serverResponse.result;
      }
    }
  } catch (error) {
    log('data: $error');
  }
  return [];
}
