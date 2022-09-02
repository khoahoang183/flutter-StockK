import 'package:flutter/material.dart';
import 'package:stockk_flutter/resources/ResourceColors.dart';

class SysRefreshIndicator extends RefreshIndicator {
  SysRefreshIndicator({Key? key, required super.child, required super.onRefresh})
      : super(key: key, color: hexToColor(ResourceColors.color_green_main));
}
