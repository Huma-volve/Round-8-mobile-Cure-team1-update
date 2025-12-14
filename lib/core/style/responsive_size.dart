import 'package:flutter/material.dart';

double responsive_size(context, {required fontsize}) {
  double scalfactor = get_scalfactor(context);
  double responsive_size = fontsize * scalfactor;
  double lowerLimit = fontsize * .8;
  double upperLimit = fontsize * 1.2;
  return responsive_size.clamp(lowerLimit, upperLimit);
}

double get_scalfactor(context) {
  double width_of_screen = MediaQuery.sizeOf(context).width;
  // PlatformDispatcher dispatcher = PlatformDispatcher.instance;
  // double physicalwidth = dispatcher.views.first.physicalSize.width;
  // double devicepixelratio = dispatcher.views.first.devicePixelRatio;
  // double width_of_screen = physicalwidth / devicepixelratio;
  if (width_of_screen < 800) {
    return width_of_screen / 550;
  } else if (width_of_screen < 1300) {
    return width_of_screen / 1000;
  } else {
    return width_of_screen / 1800;
  }
}
