

import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTimeWidge extends StatefulWidget {
  const DateTimeWidge({
    super.key,
    this.initialSelectedDate,
    this.onDateSelected,
  });
  final DateTime? initialSelectedDate;
  final ValueChanged<DateTime>? onDateSelected;

  @override
  State<DateTimeWidge> createState() => _DateTimeWidgeState();
}

class _DateTimeWidgeState extends State<DateTimeWidge> {
 DateTime selectedValue = DateTime.now();

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialSelectedDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: DatePicker(
        DateTime.now(),
        height: 78.r,
        width: 52.r,
        initialSelectedDate: selectedValue,
        selectedTextColor: Colors.white,
        monthTextStyle: const TextStyle(fontSize: 0),
        selectionColor: ColorsLight.royalBlue,
        dateTextStyle: AppTextStyles.montserratMedum16(context)
            .copyWith(color: ColorsLight.coolGrey),
        dayTextStyle: AppTextStyles.montserratMedum12(context)
            .copyWith(color: ColorsLight.coolGrey),
        onDateChange: (date) {
          setState(() {
            selectedValue = date;
          });
          widget.onDateSelected?.call(date);
        },
      ),
    );
  }}
