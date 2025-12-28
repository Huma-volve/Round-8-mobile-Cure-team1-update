
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/Booking/domain/enums/booking_enum.dart';
import 'package:cure_team_1_update/features/Booking/domain/enums/payment_status_enum.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/bookagain_bottun.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/cancel_button.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/feed_back_button.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/pay_now_button.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/reschedual_button.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/support_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

dynamic  getbuttonBasedOnBookingStatus({required  MyBookingEntity booking}){

  switch(booking.bookingStatus)
  {

    case BookingEnum.cancelled:
       return  Row(
                children: [Expanded(child: BookagainBottun(booking: booking)),SizedBox(width: 24.r,) ,const Expanded(child: SupportButton())],
              );
    case BookingEnum.completed:
     return   Row(
                children: [Expanded(child: BookagainBottun(booking: booking)),SizedBox(width: 24.r,),const Expanded(child: FeedBackButton())],
              );
    case BookingEnum.pending:
    if (booking.paymentStatus == PaymentStatus.unpaid) {
      return Row(
        children: [
          Expanded(child: CancelButton(bookId: booking.bookId)),
          SizedBox(width: 24.r,),
          Expanded(child: PayNowButton(booking: booking)),
        ],
      );
    }
    return  Row(
                children: [  Expanded(child: CancelButton(bookId: booking.bookId,)),SizedBox(width: 24.r,),   Expanded(child: ReschedualButton(booking: booking,))],
              );
  }
}
