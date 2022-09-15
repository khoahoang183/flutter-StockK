// ignore: file_names
import 'dart:core';

import 'package:stockk_flutter/base/model/BaseModel.dart';

class ProductModel extends BaseModel {
  String name = "";
  String urlImage = "";
  String urlDetail = "";
  String releaseDate = "";
  String description = "";
  String condition = "";
  double price = 0;
  double sellPrice = 0;
  int soldCount = 0;

  @override
  ProductModel() : super();

  @override
  ProductModel.withAllParams(int id, this.name, this.urlImage, this.urlDetail, this.releaseDate, this.description,
      this.condition, this.price, this.sellPrice, this.soldCount)
      : super.withAllParams(id);

  @override
  List<ProductModel> createDummyData() {
    List<ProductModel> result = <ProductModel>[];
    for (var i = 0; i < 10; i++) {
      result.add(ProductModel.withAllParams(
          i,
          "product $i",
          "https://media4.giphy.com/media/WoF3yfYupTt8mHc7va/200w.gif",
          "urlDetail",
          "releaseDate",
          "description",
          "condition",
          100 * i.toDouble(),
          100 * i.toDouble(),
          100 * i.toInt()));
    }
    return result;
  }


  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      "name": name,
      "urlImage": urlImage,
      "urlDetail": urlDetail,
      "releaseDate": releaseDate,
      "description": description,
      "condition": condition,
      "price": price,
      "sellPrice": sellPrice,
      "soldCount": soldCount,
    });

  @override
  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel.withAllParams(
        json["id"],
        json["name"],
        json["urlImage"],
        json["urlDetail"],
        json["releaseDate"],
        json["description"],
        json["condition"],
        json["price"],
        json["sellPrice"],
        json["soldCount"]);
  }
}
