import 'package:flutter/material.dart';

class LYButtonBarMacaron extends StatelessWidget {
  static final List<LYBtnBarItemMacaronColor> themecolors = [
    LYBtnBarItemMacaronColor(bgValue: 0xfff0cbea, iconValue: 0xffc077b3), //红
    LYBtnBarItemMacaronColor(bgValue: 0xffcbccf0, iconValue: 0xff4e2070), //紫
    LYBtnBarItemMacaronColor(bgValue: 0xffcbe5f0, iconValue: 0xff34505c), //蓝
    LYBtnBarItemMacaronColor(bgValue: 0xffcff0cb, iconValue: 0xff394d34), //绿
  ];

  final List<LYBtnBarItemMacaronData> itemsData;

  const LYButtonBarMacaron({super.key, required this.itemsData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        itemCount: itemsData.length,
        itemBuilder: (context, idx) {
          LYBtnBarItemMacaronData idxdata = itemsData[idx];
          return LYBtnBarItemMacaron(
            padding: const EdgeInsets.only(right: 4),
            title: idxdata.title,
            icon: idxdata.icon,
            color: themecolors[(idx % themecolors.length)],
          );
        },
      ),
    );
  }
}

class LYBtnBarItemMacaron extends StatelessWidget {
  final LYBtnBarItemMacaronColor? color;
  final IconData? icon;
  final String? title;

  final EdgeInsetsGeometry? padding;
  final VoidCallback? ontap;
  const LYBtnBarItemMacaron({
    super.key,
    this.color,
    this.icon,
    this.title,
    this.padding,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    double unit = 10;

    return Padding(
      padding: padding ?? EdgeInsets.only(),
      child: GestureDetector(
        onTap:
            ontap ??
            () {
              debugPrint('LYBtnBarItemMacaron PRESSED');
            },
        child: Container(
          height: (unit * 4),
          padding: EdgeInsets.symmetric(horizontal: unit),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(unit * 2),
            color: color != null ? Color(color!.bgValue) : Colors.amberAccent,
          ),
          child: Row(
            spacing: 2,
            children: [
              Icon(
                icon ?? Icons.abc,
                size: (unit * 1.6).truncateToDouble(),
                color: color != null ? Color(color!.iconValue) : Colors.amber,
              ),
              Text(
                title ?? '',
                style: TextStyle(
                  color: color != null ? Color(color!.iconValue) : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LYBtnBarItemMacaronData {
  final String title;
  final IconData icon;

  LYBtnBarItemMacaronData({required this.title, required this.icon});
}

class LYBtnBarItemMacaronColor {
  final int bgValue;
  final int iconValue;

  LYBtnBarItemMacaronColor({required this.bgValue, required this.iconValue});
}
