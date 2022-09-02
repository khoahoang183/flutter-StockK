import 'package:flutter/material.dart';
import 'package:stockk_flutter/model/ProductCategoryModel.dart';

class HomeCategoryListTitle extends StatelessWidget {
  final ProductCategoryModel model;

  // ignore: use_key_in_widget_constructors
  const HomeCategoryListTitle({Key? key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 20, 5),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                model.urlImage,
                fit: BoxFit.cover,
                scale: 0.1,
              ))),
    );
  }
}
