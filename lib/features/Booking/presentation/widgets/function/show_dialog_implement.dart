
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/dialog_alert_widget.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/dialog_confirm_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<dynamic> showDialogImplement(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => Dialog(
            child: Container(
              height: 475.h,
              width: 341.w,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(48)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 32.h),
                child: Column(
                  children: [
                    const DialogAlertWidget(),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(
                      'Warning!',
                      style: AppTextStyles.interSemiBold20(context)
                          .copyWith(color: ColorsLight.vividYellow),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'Cancellation must be made at least 24 hours in advance to receive a refund',
                      style: AppTextStyles.interRegular14(context)
                          .copyWith(color: ColorsLight.blueGray),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Are you sure?',
                          style: AppTextStyles.interRegular14(context)
                              .copyWith(color: ColorsLight.blueGray),
                        )),
                    SizedBox(
                      height: 16.h,
                    ),
                    const DialogConfirmButton()
                  ],
                ),
              ),
            ),
          ));
}
