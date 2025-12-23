<<<<<<< HEAD
=======
// import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
// import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/calender.dart';


>>>>>>> shaban
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/calender.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_screen_appbar.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_widget.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/select_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class BookAppointementScrollableContent extends StatelessWidget {
  BookAppointementScrollableContent({
    super.key, this.onSelectedBookData, this.onSelectBookTime,
  });
final Function(String ?selectedDate)?onSelectedBookData;

final Function(String selectedTime)?onSelectBookTime;

  final String formattedTime = DateFormat('HH:mm:ss').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
=======
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView(
        children: [
          Column(
>>>>>>> shaban
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              const DoctorDetailsAppBar(
                title: 'Book Appointment',
                ismessageIconEnable: false,
              ),
              SizedBox(
                height: 35.h,
              ),
              const DoctorDetailsWidget(),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Select a day',
                style: AppTextStyles.georgiaRegular20(context),
              ),
              SizedBox(
<<<<<<< HEAD
                height: 16.h,
              ),
              const SingleMonthCalendar(),
              SizedBox(
                height: 125.h,
              )
=======
                height: 12.r,
              ),
              
               SingleMonthCalendar(onSelectedDate: (selectedDate) {
                 onSelectedBookData?.call(selectedDate);
               },
                
              ),
            
                   SelectTimeWidget(onTimeSelected: (timeOfDay) {
                   onSelectBookTime?.call(timeOfDay);
                 }
                 ,),
              SizedBox(
                height: 130.r,
              ),
>>>>>>> shaban
            ],
          ),
        ],
      ),
    );
  }
<<<<<<< HEAD
=======
  
  
>>>>>>> shaban
}
