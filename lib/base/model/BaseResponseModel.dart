import 'package:stockk_flutter/model/ProductCategoryModel.dart';

class BaseResponseModel<T> {
  late T data;
  late int status; // default is 200
  late String message;

  BaseResponseModel();

  BaseResponseModel.withAllParams(this.data, this.status, this.message);

  Map<String, dynamic> toJson() {
    return {"data": data, "status": status, "message": message};
  }

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    if (T is List) {
      List<ProductCategoryModel> lst =
          (json["data"] as List).map((item) => ProductCategoryModel.fromJson(item)).toList();

      return BaseResponseModel.withAllParams(
        json["data"],
        json["status"],
        json["message"],
      );
    } else {
      List<ProductCategoryModel> lst =
          (json["data"] as List).map((item) => ProductCategoryModel.fromJson(item)).toList();

      return BaseResponseModel.withAllParams(
        json["data"],
        json["status"],
        json["message"],
      );
    }
  }
}
