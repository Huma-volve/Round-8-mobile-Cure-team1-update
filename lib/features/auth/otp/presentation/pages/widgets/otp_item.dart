import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpItem extends StatelessWidget {
  OtpItem({super.key});

  final defaultPinTheme = PinTheme(
    width: 50.w,
    height: 50.h,
    textStyle: TextStyle(
      fontSize: 20.sp,
      color: ColorsLight.primaryColor,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: ColorsLight.offWhite,
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.fromBorderSide(
        BorderSide(color: ColorsLight.primaryColor, width: 2.5.w),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(color: Colors.white),
    );

    return Center(
      child: Padding(
        padding: EdgeInsets.all(30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Resend code in",
                  style: AppTextStyles.styleLarge16(context),
                ),
                Text(
                  ' 55 s',
                  style: AppTextStyles.styleLarge16(context)
                      .copyWith(color: ColorsLight.primaryColor),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
