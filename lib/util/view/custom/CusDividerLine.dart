import 'package:flutter/material.dart';
import 'package:stockk_flutter/resources/ResourceDimens.dart';

import '../../../resources/ResourceColors.dart';

class CusDividerLine extends Divider {
  CusDividerLine({Key? key}) : super(key: key,height: ResourceDimens.view_divider_height, color: hexToColor(ResourceColors.color_text_gray_2));
}
