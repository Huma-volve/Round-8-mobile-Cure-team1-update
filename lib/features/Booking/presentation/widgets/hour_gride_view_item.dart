import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HourGrideViewItem extends StatelessWidget {
  const HourGrideViewItem({
    super.key,
    required this.time,
    required this.selectedTime,
  });
  final String time;
  final String selectedTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: selectedTime == time
              ? ColorsLight.royalBlue
              : ColorsLight.lightGray,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        time,
        style: AppTextStyles.montserratMedum14(context).copyWith(
            color: selectedTime == time ? Colors.white : ColorsLight.blueGray),
      )),
    );
  }
}
