import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourApointMentDateWidget extends StatelessWidget {
  const YourApointMentDateWidget({
    super.key,
    required this.selectedDayName,
    required this.selectedMonthName,
    required this.selectedDayNumber,
  });

  final String? selectedDayName;
  final String? selectedMonthName;
  final String? selectedDayNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.r,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1.r, color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.only(left: 16.w, right: 12.w),
      child: Row(
        children: [
          SizedBox(
              width: 20.r,
              height: 20.r,
              child: Image.asset(Assets.resourceImagesCalendar02)),
          SizedBox(
            width: 8.r,
          ),
          if (selectedDayName != null)
            Row(
              children: [
                Text('$selectedDayNumber,',
                    style: AppTextStyles.montserratMedum14(context)
                        .copyWith(color: ColorsLight.prussianBlue)),
                Text(selectedMonthName!,
                    style: AppTextStyles.montserratMedum14(context)
                        .copyWith(color: ColorsLight.prussianBlue)),
                Text(selectedDayName!,
                    style: AppTextStyles.montserratMedum14(context)
                        .copyWith(color: ColorsLight.prussianBlue)),
              ],
            ),
          const Spacer(),
          Image.asset(Assets.resourceImagesDownArrow),
        ],
      ),
    );
  }
}
