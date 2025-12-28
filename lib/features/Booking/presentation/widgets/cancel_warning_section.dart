import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/dialog_alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CancelWarningSection extends StatelessWidget {
  const CancelWarningSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DialogAlertWidget(),
        SizedBox(
          height: 32.r,
        ),
        Text(
          'Warning!',
          style: AppTextStyles.interSemiBold20(context)
              .copyWith(color: ColorsLight.vividYellow),
        ),
        SizedBox(
          height: 8.r,
        ),
        Text(
          'Cancellation must be made at least 24 hours in advance to receive a refund',
          style: AppTextStyles.interRegular14(context)
              .copyWith(color: ColorsLight.blueGray),
        ),
        SizedBox(
          height: 32.r,
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'Are you sure?',
              style: AppTextStyles.interRegular14(context)
                  .copyWith(color: ColorsLight.blueGray),
            )),
        SizedBox(
          height: 16.r,
        ),
      ],
    );
  }
}
