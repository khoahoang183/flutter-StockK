import 'package:flutter/material.dart';
import 'package:stockk_flutter/util/helper/dialog/DialogHelper.dart';

class BaseViewModel {
  BuildContext buildContext;

  BaseViewModel(this.buildContext);

  /// fetch API With Progressing Dialog
  Future<T> fetchAPIWithProgressingDialog<T>(Future<T> Function() fetchFunction) async {
    DialogHelper.showDialogByKey(buildContext, KEY_DIALOG_PROGRESSING);
    // Fetch data from API
    var result = await fetchFunction();
    DialogHelper.dismissDialogByKey(KEY_DIALOG_PROGRESSING);
    return result;
  }

  /// fetch API Without Progressing Dialog
  Future<T> fetchAPIWithoutProgressingDialog<T>(Future<T> Function() fetchFunction) async {
    return await fetchFunction();
  }
}
