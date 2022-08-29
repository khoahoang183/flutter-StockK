import 'package:flutter/material.dart';
import 'package:stockk_flutter/model/ProductModel.dart';

import '../../../resources/ResourceImage.dart';

class HomeCategoryListTitle extends StatelessWidget {
  final ProductModel model;

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
              child: Image.asset(
                "${ResourceImages.AssetsPrefix}img_home_ads_1.png",
                fit: BoxFit.cover,
                scale: 0.1,
              ))),
    );
  }
}
