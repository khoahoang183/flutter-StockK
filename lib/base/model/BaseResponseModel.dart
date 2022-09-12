import 'package:json_annotation/json_annotation.dart';
import 'package:stockk_flutter/base/model/BaseModel.dart';
import 'package:stockk_flutter/model/ProductCategoryModel.dart';

class BaseResponseModel<T> {

  late T result;
  late int status; // default is 200
  late String message;

  BaseResponseModel();

  BaseResponseModel.withAllParams(this.status, this.message);

  Map<String, dynamic> toJson() {
    return {"result": result, "status": status, "message": message};
  }

  BaseResponseModel fromJson(Map<String, dynamic> json) {
    //List lst = (json["result"] as List).map((item) => BaseModel.fromJson(item)).toList();
    return BaseResponseModel<T>.withAllParams(
      json["status"],
      json["message"],
    );
  }






}
