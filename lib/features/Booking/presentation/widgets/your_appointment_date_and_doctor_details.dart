
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
    this.selectedDate,
    this.selectedTime,
    this.availableDates = const {},
    this.availableTimes = const [],
    this.isAvailabilityLoading = false,
    this.availabilityError,
  });
  final MyBookingEntity booking;
  final ValueChanged<String>? onDateSelected;
  final ValueChanged<String>? onTimeSelected;
  final String? selectedDate;
  final String? selectedTime;
  final Set<String> availableDates;
  final List<String> availableTimes;
  final bool isAvailabilityLoading;
  final String? availabilityError;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyBookingItemHeader(booking: booking),
      const  CustomDivivder(),
        
    YourAppointmentDoctorDetails(booking: booking),
    SizedBox(height: 24.r,),
    YourApointMentDateWidget(
      initialDate: selectedDate ?? booking.bookDate,
      onDateSelected: onDateSelected,
      availableDates: availableDates,
    ),

    SizedBox(height: 16.r),
    if (isAvailabilityLoading)
      Padding(
        padding: EdgeInsets.only(top: 16.r),
        child: const Center(child: CircularProgressIndicator()),
      )
    else if (availabilityError != null)
      Padding(
        padding: EdgeInsets.only(top: 16.r),
        child: Text(availabilityError!),
      )
    else
      Expanded(
        child: HourGrideView(
          initialTime: selectedTime ?? booking.bookHour,
          times: availableTimes,
          emptyMessage: 'No available times for this day.',
          onTimeSelected: onTimeSelected,
        ),
      ),

      ],
    );
  }
}
