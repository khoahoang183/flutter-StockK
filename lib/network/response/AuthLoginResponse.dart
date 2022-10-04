import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stockk_flutter/base/model/BaseResponseModel.dart';
import 'package:stockk_flutter/model/ProductAdsModel.dart';
import 'package:stockk_flutter/util/helper/log/LogHelper.dart';

import '../../const/ApplicationConst.dart';
import '../../const/NetworkConst.dart';
import '../../model/AuthModel.dart';

class AuthLoginResponse extends BaseResponseModel<AuthModel> {

  @override
  AuthLoginResponse(): super();

  @override
  AuthLoginResponse.withAllParams(result, status, message) : super.withAllParams(result, status, message);

  @override
  BaseResponseModel fromJson(Map<String, dynamic> json) {
    return AuthLoginResponse.withAllParams(
      (json["result"] as List).map((item) => ProductAdsModel.fromJson(item)).toList(),
      json["status"],
      json["message"],
    );
  }

  @override
  Future<AuthModel> fetchData({url = "$BASE_URL/auth/login"}) async {
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
    return AuthModel();
  }
}
