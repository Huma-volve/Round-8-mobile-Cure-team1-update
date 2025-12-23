

import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogConfirmButton extends StatelessWidget {
  const DialogConfirmButton({
    super.key,this.onPressed
  });
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorsLight.prussianBlue,
            fixedSize: Size(245.w, 48.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        onPressed: onPressed,
        child: Text(
          'yes,Cancel',
          style: AppTextStyles.interMedum16(context).copyWith(color: Colors.white),
        ));
  }
}