
import 'package:cure_team_1_update/features/Booking/domain/enums/booking_enum.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/custom_divider.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/function/get_button_for_your_appointment.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/hour_gride_view.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_item_header.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/your_appointment_date.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/your_appointment_doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourAppointmentDateAndDoctorDetails extends StatelessWidget {
  const YourAppointmentDateAndDoctorDetails({super.key, required this.bookingStatus, });
final BookingEnum bookingStatus;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyBookingItemHeader(bookingStatus: bookingStatus),
      const  CustomDivivder(),
        
    const  YourAppointmentDoctorDetails(),
    SizedBox(height: 24.r,),
    const YourApointMentDateWidget(selectedDayName: '21', selectedMonthName: 'July', selectedDayNumber: 'Monday'),

  const Expanded(child: HourGrideView()),

const Spacer(),

getButtonforYourAppointMentPage(bookingStatus)
     
        
      ],
    );
  }
}
