import 'package:flutter/material.dart';
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
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.text_fields), label: 'text'),
    BottomNavigationBarItem(
      icon: Icon(Icons.radio_button_checked),
      label: 'control',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(top: false, bottom: false, child: pages[tabidx]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabidx,
        items: items,
        onTap: (value) {
          tabidx = value;
          setState(() {});
        },
      ),
    );
  }
}
