import 'package:stockk_flutter/base/model/BaseResponseModel.dart';
import 'package:stockk_flutter/model/ProductCategoryModel.dart';

class ProductCategoryResponse extends BaseResponseModel<List<ProductCategoryModel>> {
  @override
  BaseResponseModel fromJson(Map<String, dynamic> json) {
    BaseResponseModel baseResponseModel =  super.fromJson(json);

    List lst = (json["result"] as List).map((item) => ProductCategoryModel.fromJson(item)).toList();
    baseResponseModel.result = lst as List<ProductCategoryModel>;
    return baseResponseModel;
  }
}
