library ly_flutter_utils;

import 'package:flutter/material.dart';

export 'package:ly_flutter_utils/debug_border.dart';
export 'package:ly_flutter_utils/ly_dot_paper_background.dart';
export 'package:ly_flutter_utils/ly_glass_container.dart';
export 'package:ly_flutter_utils/ly_utils.dart';

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
