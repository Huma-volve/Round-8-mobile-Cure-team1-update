

import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_book_item_screen_body.dart';
import 'package:flutter/material.dart';

class UpdateMyBookingScreen extends StatelessWidget {
  const UpdateMyBookingScreen({super.key, required this.booking});
  final MyBookingEntity booking;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: UpdateMyBookingScreenBody(booking: booking),
    );
  }
}
