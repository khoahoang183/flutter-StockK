import 'package:flutter/material.dart';
import 'package:stockk_flutter/resources/ResourceColors.dart';

class SysAppBar extends AppBar {
  SysAppBar({Key? key})
      : super(
          toolbarHeight: 0 /* remove toolbar */,
          key: key,
          backgroundColor: hexToColor(ResourceColors.color_green_main),
          elevation: 0.0,
          automaticallyImplyLeading: false,
        );
}
