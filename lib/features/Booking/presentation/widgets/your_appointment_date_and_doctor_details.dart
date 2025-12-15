
import 'package:cure_team_1_update/features/Booking/data/models/myBooking_model.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/booking_action_button.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/booking_option_button.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/custom_divider.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/hour_gride_view.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_item_header.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/your_appointment_date.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/your_appointment_doctor_details.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourAppointmentDateAndDoctorDetails extends StatelessWidget {
  const YourAppointmentDateAndDoctorDetails({super.key, required this.mybookingModel});
final MybookingModel mybookingModel;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        MyBookingItemHeader(bookingStatus: mybookingModel.bookingStatus, isUpcomingStatus: mybookingModel.isUpcomingStatus,),
      const  CustomDivivder(),
        
    const  YourAppointmentDoctorDetails(),
    SizedBox(height: 24.h,),
    const YourApointMentDateWidget(selectedDayName: '21', selectedMonthName: 'July', selectedDayNumber: 'Monday'),

  const Expanded(child: HourGrideView()),

const Spacer(),
      SizedBox(
        width: double.infinity,
        child: BookingOptionButton(bottonName: mybookingModel.buttonOptionName)),
        SizedBox(height: 24.r,),
            SizedBox(
      width: double.infinity,
      child: BookingActionButton(bottonName: mybookingModel.buttonActionName, isCnaceledButton: true)),
       SizedBox(height: 40.r,),
        
      ],
    );
  }
}