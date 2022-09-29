import 'package:flutter/material.dart';
import 'package:stockk_flutter/resources/ResourceColors.dart';
import 'package:stockk_flutter/resources/ResourceDimens.dart';

import '../../../base/ui/BaseDialog.dart';

class DialogProgressingUI extends BaseDialog {
  DialogProgressingUI(context) : super(context);

  @override
  Widget buildCustomDialogUI() {
    return Wrap(children: [
      Center(
        child: Column(children: [
          CircularProgressIndicator(
              backgroundColor: hexToColor(ResourceColors.color_green_main),
              valueColor: AlwaysStoppedAnimation<Color>(
                hexToColor(ResourceColors.color_text_gray_11),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(
                  ResourceDimens.dimen_0, ResourceDimens.dimen_15, ResourceDimens.dimen_0, ResourceDimens.dimen_0),
              child: Text("Loading...",
                  style:
                      TextStyle(fontSize: ResourceDimens.text_size_14, color: hexToColor(ResourceColors.color_white)))),
        ]),
      )
    ]);
  }
}
