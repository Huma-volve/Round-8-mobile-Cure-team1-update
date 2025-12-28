// import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
// import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/calender.dart';


import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/Home/Data/models/api_doctor.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/calender.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_screen_appbar.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_widget.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/hour_gride_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookAppointementScrollableContent extends StatelessWidget {
  BookAppointementScrollableContent({
    super.key,
    this.doctor,
    this.onSelectedBookData,
    this.onSelectBookTime,
    this.availableDates = const {},
    this.availableTimes = const [],
    this.isLoadingAvailability = false,
    this.availabilityError,
    this.initialSelectedDate,
    this.initialSelectedTime,
  });
  final ApiDoctor? doctor;
  final Function(String ?selectedDate)?onSelectedBookData;
  final Function(String selectedTime)?onSelectBookTime;
  final Set<String> availableDates;
  final List<String> availableTimes;
  final bool isLoadingAvailability;
  final String? availabilityError;
  final String? initialSelectedDate;
  final String? initialSelectedTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView(
        children: [
          Column(
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
              DoctorDetailsWidget(doctor: doctor),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Select a day',
                style: AppTextStyles.georgiaRegular20(context),
              ),
              SizedBox(
                height: 12.r,
              ),
              if (isLoadingAvailability)
                const Center(child: CircularProgressIndicator())
              else if (availabilityError != null)
                Text(
                  availabilityError!,
                  style: AppTextStyles.montserratMedum16(context),
                )
              else
                SingleMonthCalendar(
                  availableDates: availableDates,
                  initialSelectedDate: initialSelectedDate,
                  onSelectedDate: (selectedDate) {
                    onSelectedBookData?.call(selectedDate);
                  },
                ),
              if (!isLoadingAvailability &&
                  availabilityError == null &&
                  availableDates.isEmpty)
                Padding(
                  padding: EdgeInsets.only(top: 12.r),
                  child: Text(
                    'No available dates for this doctor.',
                    style: AppTextStyles.montserratMedum16(context),
                  ),
                ),
              if (!isLoadingAvailability && availabilityError == null) ...[
                SizedBox(
                  height: 24.r,
                ),
                Text(
                  'Select a Time',
                  style: AppTextStyles.georgiaRegular20(context),
                ),
                SizedBox(
                  height: 12.r,
                ),
                HourGrideView(
                  times: availableTimes,
                  initialTime: initialSelectedTime,
                  emptyMessage: 'No available times for this day.',
                  onTimeSelected: (timeOfDay) {
                    onSelectBookTime?.call(timeOfDay);
                  },
                ),
              ],
              SizedBox(
                height: 130.r,
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  
}
