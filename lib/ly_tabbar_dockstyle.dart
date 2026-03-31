import 'package:flutter/material.dart';
import 'package:ly_flutter_utils/ly_utils.dart';

class LYTabbarDockstyle extends StatelessWidget {
  final double horizontalMargin;

  final int tabIdx;
  final ValueChanged<int>? ontap;
  final List<Widget> items;
  const LYTabbarDockstyle({
    super.key,
    this.horizontalMargin = 10,
    required this.tabIdx,
    this.ontap,
    this.items = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    // prepare bar items
    List<BottomNavigationBarItem> baritems = [];
    for (Widget one in items) {
      BottomNavigationBarItem item = BottomNavigationBarItem(
        icon: one,
        label: '',
      );
      baritems.add(item);
    }
    return SafeArea(
      bottom: true,
      child: LYGlassContainer(
        sigma: 2.3,
        height: 60,
        cornerRadius: 20,
        margin: EdgeInsets.only(
          left: horizontalMargin,
          right: horizontalMargin,
        ),
        child: BottomNavigationBar(
          // STYLE
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,

          // HIDE LABEL
          showSelectedLabels: false,
          showUnselectedLabels: false,

          // FIX ICON VERTICIAL OFFSET
          selectedFontSize: 0,
          unselectedFontSize: 0,

          // BAR OPS
          items: baritems,
          currentIndex: tabIdx,
          onTap: ontap,
        ),
      ),
    );
  }
}
