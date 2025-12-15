import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget buildEmptyState() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Visual representation of the card stack using SVG
        SvgPicture.asset(
          Assets.paymentLogosApplePay, // Replaced manual stack with Group.svg
          width: 200.w, // Adjusted size
          height: 120.h,
        ),
        SizedBox(height: 24.h),
        Text('Nothing to display here!', style: AppTextStyles.styleLarge12),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.w),
          child: Text(
            'Add your cards to make payment easier',
            textAlign: TextAlign.center,
            style: AppTextStyles.styleSmall10,
          ),
        ),
        SizedBox(height: 60.h),
      ],
    ),
  );
}
