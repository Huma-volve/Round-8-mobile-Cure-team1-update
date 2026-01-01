

import 'package:cure_team_1_update/features/Booking/domain/enums/booking_enum.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_book_item_screen_body.dart';
import 'package:flutter/material.dart';

class UpdateMyBookingScreen extends StatelessWidget {
  const UpdateMyBookingScreen({super.key, required this.bookingStatus,});
final BookingEnum bookingStatus;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: UpdateMyBookingScreenBody(bookingStatus: bookingStatus,),
    );
  }
}
