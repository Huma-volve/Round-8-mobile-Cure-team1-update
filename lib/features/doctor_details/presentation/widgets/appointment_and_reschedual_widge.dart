import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ApointMentAndReschedualWidget extends StatelessWidget {
  final String? appointmentDate;
  final String? appointmentTime;
  const ApointMentAndReschedualWidget({
    super.key,
    this.appointmentDate,
    this.appointmentTime,
  });

  @override
  Widget build(BuildContext context) {
    final formatted = _formatAppointment(appointmentDate, appointmentTime);
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
          formatted,
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

String _formatAppointment(String? date, String? time) {
  final trimmedDate = date?.trim();
  final trimmedTime = time?.trim();
  String? formattedDate;

  if (trimmedDate != null && trimmedDate.isNotEmpty) {
    final parsed = DateTime.tryParse(trimmedDate);
    formattedDate = parsed != null
        ? DateFormat('EEEE,MMMM d').format(parsed)
        : trimmedDate;
  }

  if (formattedDate != null && formattedDate.isNotEmpty) {
    if (trimmedTime != null && trimmedTime.isNotEmpty) {
      return '$formattedDate - $trimmedTime';
    }
    return formattedDate;
  }

  if (trimmedTime != null && trimmedTime.isNotEmpty) {
    return trimmedTime;
  }

  return 'Select appointment';
}
