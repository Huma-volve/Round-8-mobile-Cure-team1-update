

import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentWarning extends StatelessWidget {
  const AppointmentWarning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.r,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsLight.lightGreen,
        borderRadius: BorderRadius.circular(5.r)
      ),
      child:Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
    height: 24.r,
    width: 24.r,
    child: Image.asset(Assets.resourceImagesWarning),
        ),
        SizedBox(width: 6.r),
        Flexible( 
    child: Text(
      'Cancellation must be made at least 24 hours in advance to receive a refund',
      style: AppTextStyles.interRegular14(context).copyWith(color: ColorsLight.transparentBrightYellow),
    ),
        ),
      ],
    ));
  }
}