import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stockk_flutter/base/model/BaseResponseModel.dart';
import 'package:stockk_flutter/model/ProductModel.dart';
import 'package:stockk_flutter/util/helper/log/LogHelper.dart';

import '../../const/ApplicationConst.dart';
import '../../const/NetworkConst.dart';

class ProductSearchResponse extends BaseResponseModel<List<ProductModel>> {
  @override
  ProductSearchResponse() : super();

  @override
  ProductSearchResponse.withAllParams(result, status, message) : super.withAllParams(result, status, message);

  @override
  BaseResponseModel fromJson(Map<String, dynamic> json) {
    return ProductSearchResponse.withAllParams(
      (json["result"] as List).map((item) => ProductModel.fromJson(item)).toList(),
      json["status"],
      json["message"],
    );
  }

  @override
  Future<List<ProductModel>> fetchData(
      {url = "$BASE_URL/productSearch", paramsData = const {}, postData = const {}}) async {
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
