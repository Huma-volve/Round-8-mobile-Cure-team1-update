import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget buildEmptyState({required BuildContext context}) {
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
        Text('Nothing to display here!',
            style: StyleTextHelper.textStyle12Regular(context)),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.w),
          child: Text(
            'Add your first card to make payments faster and easier.',
            textAlign: TextAlign.center,
            style: StyleTextHelper.textStyle12Regular(context),
          ),
        ),
        SizedBox(height: 60.h),
      ],
    ),
  );
}
