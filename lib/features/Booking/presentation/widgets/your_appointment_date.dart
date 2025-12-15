
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
      height: 48.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
      padding:  EdgeInsets.only(left: 16.w,right: 12.w),
      child: Row(
        children: [
           SizedBox(
            width: 20.w,
            height: 20.h,
            child: Image.asset(Assets.resourceImagesCalendar02)),
         SizedBox(width: 8.w,),
          if (selectedDayName != null)
            Row(
             
              children: [
                                Text('${selectedDayNumber},',style: AppTextStyles.montserratMedum14(context).copyWith(color: ColorsLight.prussianBlue)),
                                                Text(selectedMonthName!, style: AppTextStyles.montserratMedum14(context).copyWith(color: ColorsLight.prussianBlue)),
                Text(selectedDayName!, style: AppTextStyles.montserratMedum14(context).copyWith(color: ColorsLight.prussianBlue)),


              ],
            ),
          Spacer(),
             Image.asset(Assets.resourceImagesDownArrow),
        ],
      ),
    );
  }
}
