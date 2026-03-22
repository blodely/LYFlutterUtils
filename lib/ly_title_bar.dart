import 'package:flutter/material.dart';
import 'package:ly_flutter_utils/ly_utils.dart';

class LYTitleBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? rightButtons;
  const LYTitleBar({super.key, this.title, this.rightButtons});

  @override
  Widget build(BuildContext context) {
    return LYGlassContainer(
      child: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: preferredSize.height,
              decoration: BoxDecoration(color: Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // LEFT Padding
                  SizedBox(width: 15),

                  // TITLE
                  Text(
                    '$title',
                    style: TextStyle(
                      color:
                          Theme.of(context).brightness == Brightness.light
                              ? Colors.black
                              : Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // SPACE BETWEEN
                  Spacer(),

                  // RIGHT BUTTONS
                  Row(children: rightButtons ?? []),

                  // RIGHT Padding
                  SizedBox(width: 15),
                ],
              ),
            ),

            // BOTTOM LINE
            Container(height: 0.5, color: Colors.white.withValues(alpha: 0.04)),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
