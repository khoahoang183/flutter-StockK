// ignore: file_names
import 'dart:core';

import 'package:stockk_flutter/base/model/BaseModel.dart';

class AuthModel extends BaseModel {
  String userName = "";
  String displayName = "";
  String email = "";
  String accessToken = "";

  @override
  AuthModel() : super();

  @override
  AuthModel.withAllParams(int id, this.userName, this.displayName, this.email, this.accessToken)
      : super.withAllParams(id);

  @override
  List<AuthModel> createDummyData() {
    List<AuthModel> result = <AuthModel>[];
    for (var i = 0; i < 10; i++) {
      result.add(AuthModel.withAllParams(i, "", "", "", ""));
    }
    return result;
  }

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      "userName": userName,
      "displayName": displayName,
      "email": email,
      "accessToken": accessToken,
    });

  @override
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel.withAllParams(
        json["id"], json["userName"], json["displayName"], json["email"], json["accessToken"]);
  }
}
