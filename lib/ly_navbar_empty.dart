import 'package:flutter/material.dart';
import 'package:ly_flutter_utils/ly_utils.dart';

class LYNavbarEmpty extends StatelessWidget implements PreferredSizeWidget {
  final Widget? child;
  const LYNavbarEmpty({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return LYGlassContainer(
      sigma: 16,

      // REMOVE DEFAULT VALUES
      cornerRadius: 0,
      borderWidth: 0,

      child: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: preferredSize.height,
              decoration: BoxDecoration(color: Colors.transparent),
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
