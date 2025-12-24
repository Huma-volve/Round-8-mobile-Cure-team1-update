import 'dart:developer';

import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class YourApointMentDateWidget extends StatefulWidget {
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
  State<YourApointMentDateWidget> createState() =>
      _YourApointMentDateWidgetState();
}

class _YourApointMentDateWidgetState extends State<YourApointMentDateWidget> {
  bool activeCalender = false;
  String? formatedDate;
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
         Text(formatedDate ??'',
                    style: AppTextStyles.montserratMedum14(context)
                        .copyWith(color: ColorsLight.prussianBlue)),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              setState(() {
                activeCalender = !activeCalender;
              });
              if (activeCalender) {
                DateTime? selectedDateTime = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2027),
                );
                if(selectedDateTime!=null)
                {
                formatedDate=DateFormat('EEEE,MMMM d').format(selectedDateTime);
                  log(formatedDate!);
                }
              }
            },
            child: SizedBox(
                height: 24.r,
                width: 24.r,
                child: Image.asset(activeCalender == true
                    ? Assets.resourceImagesDownArrow
                    : Assets.resourceImagesAltArrowDown)),
          ),
        ],
      ),
    );
  }
}
