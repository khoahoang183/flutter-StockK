import 'dart:developer';

import 'package:flutter/foundation.dart';

class LogHelper {
  static const String _author = "KhoaHD (Steve)";

  /// Use if you're inside a Flutter Widget
  static void logBuild(String message) {
    log('$_author: $message');
  }

  /// Use if you're inside a Flutter Widget
  static void logWidget(String message) {
    debugPrint('$_author: $message');
  }
}
