import 'package:flutter/material.dart';

class LYHub {
  // PRIVATE
  LYHub._();

  // SHOW SNACKBAR WITH MESSAGE
  static void showBar(BuildContext ctx, [String? text, Color? bg]) {
    ScaffoldMessenger.of(
      ctx,
    ).showSnackBar(SnackBar(content: Text(text ?? ''), backgroundColor: bg));
  }

  // SHOW SNACKBAR SUCCESS MESSAGE
  static void showSuccessBar(BuildContext ctx, [String? text]) {
    LYHub.showBar(ctx, text, Colors.green);
  }

  // SHOW SNACKBAR ERROR MESSAGE
  static void showErrorBar(BuildContext ctx, [String? text]) {
    LYHub.showBar(ctx, text, Colors.red);
  }
}
