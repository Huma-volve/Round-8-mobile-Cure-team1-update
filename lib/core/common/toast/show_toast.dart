import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';


void showToast({
  required BuildContext context,
  required String text,
  required Color colorText,
  required ToastStates toastState,
}) =>
    showSimpleNotification(
        Text(
          text,
        ),
        position: NotificationPosition.top,
        
        autoDismiss: true,
        slideDismissDirection: DismissDirection.horizontal,
        background: toastColor(toastState));

enum ToastStates { SUCCECC, ERROR, WARNING }

Color toastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCECC:
      color = Colors.green;
    case ToastStates.ERROR:
      color = Colors.red;
    case ToastStates.WARNING:
      color = Colors.yellow;
  }
  return color;
}
