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
  double soldCount = 0;

  ProductModel();

  ProductModel.withAllParams(this.name, this.urlImage, this.urlDetail, this.releaseDate, this.description,
      this.condition, this.price, this.sellPrice, this.soldCount);

  @override
  List<ProductModel> createDummyData() {
    List<ProductModel> result = <ProductModel>[];
    for (var i = 0; i < 10; i++) {
      result.add(ProductModel.withAllParams(
          "product $i",
          "https://media4.giphy.com/media/WoF3yfYupTt8mHc7va/200w.gif",
          "urlDetail",
          "releaseDate",
          "description",
          "condition",
          100 * i.toDouble(),
          100 * i.toDouble(),
          100 * i.toDouble()));
    }
    return result;
  }

  bool isTest(String value) {
    return value == 'Test';
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
