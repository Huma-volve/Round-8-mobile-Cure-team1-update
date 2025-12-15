

import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/calender.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_screen_appbar.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookAppointementScrollableContent extends StatelessWidget {
  const BookAppointementScrollableContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h,),
                const DoctorDetailsAppBar(title: 'Book Appointment',ismessageIconEnable: false,),
                 SizedBox(height: 35.h,),
                const DoctorDetailsWidget(),
                 SizedBox(height: 24.h,),
                Text('Select a day',style: AppTextStyles.georgiaRegular20(context),),
                SizedBox(height: 16.h,),
               const SingleMonthCalendar(),
           SizedBox(height: 125.h,)
          
            ],
          ),
        ),
      ],
    );
  }
}