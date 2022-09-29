import 'package:flutter/material.dart';
import 'package:stockk_flutter/resources/ResourceColors.dart';

class ResourceThemes {
  static final applicationTheme = ThemeData(
      fontFamily: 'SpoqaHanSans',
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: hexToColor(ResourceColors.color_green_main)));
}
