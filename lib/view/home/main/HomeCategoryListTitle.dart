import 'package:flutter/material.dart';
import 'package:stockk_flutter/model/ProductCategoryModel.dart';
import 'package:stockk_flutter/resources/ResourceDimens.dart';

import '../../../util/view/custom/CusImage.dart';

class HomeCategoryListTitle extends StatelessWidget {
  final ProductCategoryModel model;

  // ignore: use_key_in_widget_constructors
  const HomeCategoryListTitle({Key? key, required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: ResourceDimens.view_height_120,
        width: ResourceDimens.view_height_120,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              ResourceDimens.dimen_0, ResourceDimens.dimen_5, ResourceDimens.dimen_10, ResourceDimens.dimen_5),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(ResourceDimens.dimen_10),
              child: buildCusImageNetwork(model.urlImage)),
        ));
  }
}
