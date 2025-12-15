import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Logout',
              style: AppTextStyles.styleLarge10,
            ),
            SizedBox(height: 8.h),
            const Divider(),
            SizedBox(height: 16.h),
            Text(
              'Are you sure you want to log out?',
              textAlign: TextAlign.center,
              style: AppTextStyles.styleSmall8.copyWith(
                color: ColorsLight.textMain,
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'Cancel',
                    backgroundColor: Colors.grey,
                    textColor: ColorsLight.textMain,
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CustomButton(
                    text: 'Yes, Logout',
                    onPressed: () {
                      Navigator.pop(context);
                      // Perform logout implementation
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
