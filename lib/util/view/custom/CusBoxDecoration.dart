import 'package:flutter/material.dart';

import '../../../resources/ResourceColors.dart';
import '../../../resources/ResourceDimens.dart';

BoxDecoration buildCusBoxDecorationShadow() => BoxDecoration(
    color: hexToColor(ResourceColors.color_white),
    borderRadius: BorderRadius.circular(ResourceDimens.dimen_5),
    boxShadow: [
      BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 1, blurRadius: 2 // changes position of shadow
          ),
    ],
    border: Border.all(color: hexToColor(ResourceColors.color_text_gray_11)));
