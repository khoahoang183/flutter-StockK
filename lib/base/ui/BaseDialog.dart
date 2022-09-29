import 'package:flutter/material.dart';

abstract class BaseDialog {
  late AlertDialog dialog;
  late BuildContext context;

  /// Constructor
  BaseDialog(this.context) {
    dialog = AlertDialog(
      content: buildCustomDialogUI(),
      backgroundColor: Colors.transparent,
    );
  }

  /// build UI
  Widget buildCustomDialogUI();

  /// show UI
  void showCustomDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  /// dismiss UI
  void dismissCustomDialog() {
    Navigator.pop(context);
  }
}
