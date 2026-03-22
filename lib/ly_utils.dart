library ly_flutter_utils;

import 'package:flutter/material.dart';

export 'debug_border.dart';

class LYUtils {
  // Singleton
  static final LYUtils _kit = LYUtils._internal();
  static LYUtils get kit => _kit;
  LYUtils._internal();

  // Theme brightness status
  bool isLight(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }
}
