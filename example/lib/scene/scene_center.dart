import 'package:flutter/material.dart';
import 'package:ly_flutter_utils/ly_tabbar_dockstyle.dart';
import 'package:ly_flutter_utils_example/scene/page_control.dart';
import 'package:ly_flutter_utils_example/scene/page_text.dart';

class SceneCenter extends StatefulWidget {
  const SceneCenter({super.key});

  @override
  State<SceneCenter> createState() => _SceneCenterState();
}

class _SceneCenterState extends State<SceneCenter> {
  int tabidx = 0;

  // Demo pages
  List<Widget> pages = [PageText(), PageControl()];
  List<Icon> items = [
    Icon(Icons.text_fields),
    Icon(Icons.radio_button_checked),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(top: false, bottom: false, child: pages[tabidx]),
      bottomNavigationBar: LYTabbarDockstyle(
        tabIdx: tabidx,
        horizontalMargin: 30,
        items: items,
        ontap: (value) {
          tabidx = value;
          setState(() {});
        },
      ),
    );
  }
}
