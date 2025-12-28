


import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/functions/formated_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SelectTimeWidget extends StatefulWidget {
  const SelectTimeWidget({super.key,this.onTimeSelected});
final Function(String timeOfDay)?onTimeSelected;
  @override
  State<SelectTimeWidget> createState() => _SelectTimeWidgetState();
}

class _SelectTimeWidgetState extends State<SelectTimeWidget> {
  TimeOfDay? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
                'Select a Time',
                style: AppTextStyles.georgiaRegular20(context),
              ),
              SizedBox(height: 16.r,),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(100.r, 40.r),
                backgroundColor: ColorsLight.grey1,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r))),
            onPressed: () async {
              TimeOfDay? time = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());
              if (time != null) {
                setState(() {
                  selectedTime = time;
                 
                });
                widget.onTimeSelected?.call(formattedSelectedTime(selectedTime??TimeOfDay.now()));
              }
            },
            child: Text(
              selectedTime == null
                  ? formattedTimeOfDay()
                  : formattedSelectedTime(selectedTime!),
              style: AppTextStyles.montserratMedum16(context),
            ))
      ],
    );
  }
}
