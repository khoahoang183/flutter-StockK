import 'dart:convert';

import 'package:stockk_flutter/base/model/BaseModel.dart';
import 'package:stockk_flutter/model/ProductModel.dart';

class ProductGroupModel extends BaseModel {
  String groupTitle = "";
  int viewCategory = 1;
  List<ProductModel> childList = <ProductModel>[];

  @override
  ProductGroupModel();

  @override
  ProductGroupModel.withAllParams(int id, this.groupTitle, this.viewCategory, this.childList) : super.withAllParams(id);

  @override
  List<ProductGroupModel> createDummyData() {
    return <ProductGroupModel>[
      ProductGroupModel.withAllParams(1, "Popular Sneaker", 1, ProductModel().createDummyData()),
      ProductGroupModel.withAllParams(2, "Popular Brand", 1, ProductModel().createDummyData()),
      ProductGroupModel.withAllParams(3, "Featured Apparel", 1, ProductModel().createDummyData()),
      ProductGroupModel.withAllParams(4, "Popular Electronics", 1, ProductModel().createDummyData()),
      ProductGroupModel.withAllParams(5, "Featured Trading Cards", 1, ProductModel().createDummyData())
    ];
  }

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll({
      "groupTitle": groupTitle,
      "viewCategory": viewCategory,
      "childList": jsonEncode(childList.map((e) => e.toJson()).toList()).toString(),
    });

  @override
  factory ProductGroupModel.fromJson(Map<String, dynamic> json) {
    return ProductGroupModel.withAllParams(json["id"], json["groupTitle"], json["viewCategory"],
        (json["childList"] as List).map((item) => ProductModel.fromJson(item)).toList());
  }
}
