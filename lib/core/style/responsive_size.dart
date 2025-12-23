import 'package:flutter/material.dart';

double responsive_size(context, {required fontsize}) {
  double scalfactor = get_scalfactor(context);
  double responsiveSize = fontsize * scalfactor;
  double lowerLimit = fontsize * .6;
  double upperLimit = fontsize * 1.2;
  return responsiveSize.clamp(lowerLimit, upperLimit);
}

double get_scalfactor(context) {
  double widthOfScreen = MediaQuery.sizeOf(context).width;
  // PlatformDispatcher dispatcher = PlatformDispatcher.instance;
  // double physicalwidth = dispatcher.views.first.physicalSize.width;
  // double devicepixelratio = dispatcher.views.first.devicePixelRatio;
  // double width_of_screen = physicalwidth / devicepixelratio;
  if (widthOfScreen < 800) {
    return widthOfScreen / 550;
  } else if (widthOfScreen < 1300) {
    return widthOfScreen / 1000;
  } else {
    return widthOfScreen / 1800;
  }
}
