import 'package:flutter/material.dart';
import 'package:stockk_flutter/base/ui/BaseDialog.dart';
import 'package:stockk_flutter/util/helper/dialog/DialogProgressingUI.dart';

// ignore: constant_identifier_names
const String KEY_DIALOG_PROGRESSING = "KEY_DIALOG_PROGRESSING";

class DialogHelper {
  static BaseDialog? dialog;

  static void showDialogByKey(BuildContext context, String key) {
    switch (key) {
      case KEY_DIALOG_PROGRESSING:
        {
          dialog = DialogProgressingUI(context);
        }
    }
    dialog?.showCustomDialog();
  }

  static void dismissDialogByKey(String key) {
    dialog?.dismissCustomDialog();
  }
}
