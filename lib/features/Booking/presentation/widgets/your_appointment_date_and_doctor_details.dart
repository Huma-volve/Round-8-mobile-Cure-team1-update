
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/custom_divider.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/hour_gride_view.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_item_header.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/your_appointment_date.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/your_appointment_doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourAppointmentDateAndDoctorDetails extends StatelessWidget {
  const YourAppointmentDateAndDoctorDetails({
    super.key,
    required this.booking,
    this.onDateSelected,
    this.onTimeSelected,
  });
  final MyBookingEntity booking;
  final ValueChanged<String>? onDateSelected;
  final ValueChanged<String>? onTimeSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyBookingItemHeader(booking: booking),
      const  CustomDivivder(),
        
    YourAppointmentDoctorDetails(booking: booking),
    SizedBox(height: 24.r,),
    YourApointMentDateWidget(
      initialDate: booking.bookDate,
      onDateSelected: onDateSelected,
    ),

  Expanded(
    child: HourGrideView(
      initialTime: booking.bookHour,
      onTimeSelected: onTimeSelected,
    ),
  ),

      ],
    );
  }
}
