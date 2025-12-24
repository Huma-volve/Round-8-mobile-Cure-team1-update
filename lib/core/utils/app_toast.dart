import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  static void show(
    BuildContext context,
    String message, {
    ToastGravity gravity = ToastGravity.BOTTOM,
    Duration duration = const Duration(seconds: 2),
    Color backgroundColor = const Color(0xFF2C2C2C),
    Color textColor = Colors.white,
  }) {
    final toast = FToast()..init(context);
    final maxWidth = MediaQuery.sizeOf(context).width * 0.9;

    toast.showToast(
      gravity: gravity,
      toastDuration: duration,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
