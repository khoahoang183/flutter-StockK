// ignore: file_names
import 'dart:core';
import 'dart:ffi';
import 'package:flutter/material.dart';

class ProductModel {
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

  ProductModel.withAll(this.name, this.urlImage, this.urlDetail, this.releaseDate, this.description, this.condition, this.price,
      this.sellPrice, this.soldCount);

  List<ProductModel> getDummyList() {
    List<ProductModel> result = <ProductModel>[];
    for (var i = 0; i < 20; i++) {
      result.add(ProductModel.withAll(
          "product $i", "urlImage", "urlDetail", "releaseDate", "description", "condition", 100, 100, 100));
    }
    return result;
  }

  bool isTest(String value) {
    return value == 'Test';
  }
}
