
import 'dart:ffi';

import 'package:stockk_flutter/base/BaseModel.dart';

class BaseResponseModel<T>{
  late T data;
  late int status; // default is 200
  late String message;

  Map<String,dynamic> toJson(){
    return {
      "data": data,
      "status": status,
      "message": message
    };
  }
}