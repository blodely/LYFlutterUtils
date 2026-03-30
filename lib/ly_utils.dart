library ly_flutter_utils;

import 'package:flutter/material.dart';

export 'package:ly_flutter_utils/debug_border.dart';
export 'package:ly_flutter_utils/ly_dot_paper_background.dart';
export 'package:ly_flutter_utils/ly_glass_container.dart';
export 'package:ly_flutter_utils/ly_title_bar.dart';
export 'package:ly_flutter_utils/ly_button_bar_macaron.dart';
export 'package:ly_flutter_utils/ly_utils.dart';
export 'package:ly_flutter_utils/ly_hub.dart';
export 'package:ly_flutter_utils/ly_placeholder.dart';
export 'package:ly_flutter_utils/ly_bordered_container.dart';

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

extension Screen on LYUtils {
  Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  EdgeInsets padding(BuildContext context) {
    return MediaQuery.of(context).padding;
  }

  double safeTop(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  double safeBtm(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }
}
