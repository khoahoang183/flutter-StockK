// ignore: file_names
import 'dart:core';

import 'package:stockk_flutter/base/model/BaseModel.dart';

class ProductAdsModel extends BaseModel {
  String name = "";
  String urlImage = "";
  String urlDetail = "";

  @override
  ProductAdsModel() : super();

  @override
  ProductAdsModel.withAllParams(int id, this.name, this.urlImage, this.urlDetail) : super.withAllParams(id);

  @override
  List<ProductAdsModel> createDummyData() {
    List<ProductAdsModel> result = <ProductAdsModel>[];
    for (var i = 0; i < 10; i++) {
      result.add(ProductAdsModel.withAllParams(
          i, "product $i", "https://media4.giphy.com/media/WoF3yfYupTt8mHc7va/200w.gif", "urlDetail"));
    }
    return result;
  }

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      "name": name,
      "urlImage": urlImage,
      "urlDetail": urlDetail,
    });

  @override
  factory ProductAdsModel.fromJson(Map<String, dynamic> json) {
    return ProductAdsModel.withAllParams(
        json["id"],
        json["name"],
        json["urlImage"],
        json["urlDetail"]);
  }
}
