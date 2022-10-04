import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stockk_flutter/base/model/BaseResponseModel.dart';
import 'package:stockk_flutter/model/ProductCategoryModel.dart';
import 'package:stockk_flutter/util/helper/log/LogHelper.dart';

import '../../const/ApplicationConst.dart';
import '../../const/NetworkConst.dart';

class ProductCategoriesResponse extends BaseResponseModel<List<ProductCategoryModel>> {
  @override
  ProductCategoriesResponse() : super();

  @override
  ProductCategoriesResponse.withAllParams(result, status, message) : super.withAllParams(result, status, message);

  @override
  BaseResponseModel fromJson(Map<String, dynamic> json) {
    return ProductCategoriesResponse.withAllParams(
      (json["result"] as List).map((item) => ProductCategoryModel.fromJson(item)).toList(),
      json["status"],
      json["message"],
    );
  }

  @override
  Future<List<ProductCategoryModel>> fetchData(
      {url = "$BASE_URL/productCategories", paramsData = const {}, postData = const {}}) async {
    try {
      final httpResponse = await http.get(Uri.parse(url));
      if (httpResponse.statusCode == NETWORK_STATUS_SUCCESS) {
        var baseResponse = fromJson(jsonDecode(httpResponse.body));
        if (baseResponse.status == NETWORK_STATUS_SUCCESS) {
          /// Call API success
          return baseResponse.result;
        }
      }
    } catch (error) {
      LogHelper.logBuild(error.toString());
    }
    return [];
  }
}
