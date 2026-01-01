
import 'package:cure_team_1_update/features/Booking/domain/enums/booking_enum.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/bookagain_bottun.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/cancel_button.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/feed_back_button.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/reschedual_button.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/support_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

dynamic  getbuttonBasedOnBookingStatus({required  BookingEnum bookingStatus,required int bookId}){

  switch(bookingStatus)
  {

    case BookingEnum.cancelled:
       return  Row(
                children: [const  Expanded(child: BookagainBottun()),SizedBox(width: 24.r,) ,const Expanded(child: SupportButton())],
              );
    case BookingEnum.completed:
     return   Row(
                children: [const Expanded(child: BookagainBottun()),SizedBox(width: 24.r,),const Expanded(child: FeedBackButton())],
              );
    case BookingEnum.pending:
    return  Row(
                children: [  Expanded(child: CancelButton(bookId: bookId,)),SizedBox(width: 24.r,),   Expanded(child: ReschedualButton(bookingStatus: bookingStatus,))],
              );
  }
}