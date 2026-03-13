library ly_flutter_utils;

import 'package:flutter/material.dart';

export 'debug_border.dart';

class LYFlutterUtils {
  // Singleton
  static final LYFlutterUtils _kit = LYFlutterUtils._internal();
  static LYFlutterUtils get kit => _kit;
  LYFlutterUtils._internal();

  // Theme brightness status
  bool isThemeLight(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }
}
