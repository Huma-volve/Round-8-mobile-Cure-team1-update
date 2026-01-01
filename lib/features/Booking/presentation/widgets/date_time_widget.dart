

import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateTimeWidge extends StatefulWidget {
  const DateTimeWidge({
    super.key,
  });

  @override
  State<DateTimeWidge> createState() => _DateTimeWidgeState();
}

class _DateTimeWidgeState extends State<DateTimeWidge> {
 DateTime selectedValue=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DatePicker(
        DateTime.now(),
        width: 50.r,
        initialSelectedDate: selectedValue,
    
        selectedTextColor: Colors.white,
        
        monthTextStyle: const TextStyle(fontSize: 0),
         selectionColor: ColorsLight.royalBlue,    
        dateTextStyle: AppTextStyles.montserratMedum16(context),
        dayTextStyle: AppTextStyles.montserratMedum14(context),
        onDateChange: (date) {
          setState(() {
            selectedValue = date;

            
          });
        },
      );
  }}
