import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ApointMentAndReschedualWidget extends StatelessWidget {
  const ApointMentAndReschedualWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 20.w,
            height: 20.h,
            child: Image.asset(Assets.resourceImagesCalendar02)),
        SizedBox(
          width: 8.w,
        ),
        Text(
          'Friday,July17-4:00pm',
          style: AppTextStyles.montserratMedum14(context)
              .copyWith(color: ColorsLight.prussianBlue),
        ),
        const Spacer(),
        TextButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: Text(
              'Reschedule',
              style: AppTextStyles.montserratRegular14(context)
                  .copyWith(color: ColorsLight.royalBlue),
            ))
      ],
    );
  }
}
