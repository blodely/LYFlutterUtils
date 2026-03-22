import 'package:flutter/material.dart';
import 'package:ly_flutter_utils/ly_utils.dart';

class LYTitleBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? rightButtons;
  const LYTitleBar({super.key, this.title, this.rightButtons});

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Navigator.canPop(context) == true
                      ? BackButton()
                      : SizedBox(width: 15), // LEFT Padding
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

// BAR BUTTON
class LYTitleBarButton extends StatelessWidget {
  final double? width;
  final IconData? icon;
  final double? iconSize;
  final VoidCallback? ontap;
  const LYTitleBarButton({
    super.key,
    this.width,
    this.icon,
    this.iconSize,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          ontap ??
          () {
            debugPrint('LYTitleBarButton PRESSED.');
          },
      child: Container(
        decoration: BoxDecoration(),
        child: Container(
          width: width ?? 44,
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: iconSize ?? ((width ?? 44) * 0.8).truncateToDouble(),
          ),
        ),
      ),
    );
  }
}
