import 'dart:io';

import 'scene/scene_center.dart';
import 'package:flutter/material.dart';

ThemeData themelight = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.deepPurple,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  focusColor: Colors.transparent,
  hoverColor: Colors.transparent,
  useMaterial3: true,
);
ThemeData themedark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurpleAccent,
  highlightColor: Colors.transparent,
  splashColor: Colors.transparent,
  focusColor: Colors.transparent,
  hoverColor: Colors.transparent,
  useMaterial3: true,
);

void main() {
  if (Platform.isIOS) {
    runApp(
      MaterialApp(
        title: 'ly_flutter_utils demo',
        theme: themelight,
        darkTheme: themedark,
        debugShowCheckedModeBanner: false,
        home: SceneCenter(),
      ),
    );
  }
}
