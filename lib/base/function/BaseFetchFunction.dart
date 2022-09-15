import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:stockk_flutter/model/ProductCategoryModel.dart';
import 'package:stockk_flutter/network/response/ProductCategoriesResponse.dart';

import '../model/BaseModel.dart';
import '../model/BaseResponseModel.dart';


Future<T?> fetchServerResponseModel<T extends BaseResponseModel>(String url) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var serverResponse = (T as T).fromJson(jsonDecode(response.body));
      if (serverResponse.status == 200) {
        /// Call API success
        return serverResponse as T;
      }
    }
  } catch (error) {
    log('data: $error');
  }
  return null;
}
