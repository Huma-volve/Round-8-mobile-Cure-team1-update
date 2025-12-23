import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
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
              style: StyleTextHelper.textStyle16Regular(context),
            ),
            SizedBox(height: 8.h),
            const Divider(),
            SizedBox(height: 16.h),
            Text(
              'Are you sure you want to log out?',
              textAlign: TextAlign.center,
              style: StyleTextHelper.textStyle16Regular(context).copyWith(
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
