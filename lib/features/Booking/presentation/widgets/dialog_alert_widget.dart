import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogAlertWidget extends StatelessWidget {
  const DialogAlertWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 131.h,
      width: 131.w,
      decoration: BoxDecoration(
          color: ColorsLight.creamyLight,
          borderRadius: BorderRadius.circular(107)),
      child: Center(child: Image.asset(Assets.resourceImagesAlert02)),
    );
  }
}
