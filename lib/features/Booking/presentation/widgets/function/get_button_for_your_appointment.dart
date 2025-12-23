
  import 'package:cure_team_1_update/features/Booking/domain/enums/booking_enum.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/bookagain_bottun.dart';
// import 'package:cure_team_1_update/features/Booking/presentation/widgets/cancel_button.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/feed_back_button.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/reschedual_button.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/support_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

getButtonforYourAppointMentPage(BookingEnum bookingStatus) {
    switch(bookingStatus) {
      case BookingEnum.cancelled:
       return Column(
        children: [
             const SizedBox(
        width: double.infinity,
        child:  SupportButton()),
              SizedBox(height: 24.r,),
     const    SizedBox(
          width:      double.infinity,
          child:  BookagainBottun()),
         
      
        ],
       );
      case BookingEnum.completed:
        return Column(
        children: [
           const SizedBox(
            width:   double.infinity,
              
              child:  FeedBackButton()),
              SizedBox(height: 24.r,),
         const SizedBox(
          width:   double.infinity,
          child:  BookagainBottun()),
        
       
        ],
       );
      case BookingEnum.pending:
         return Column(
        children: [
         SizedBox(
        width:   double.infinity,
        child:  ReschedualButton(bookingStatus: bookingStatus,)),
             SizedBox(height: 24.r,),
      //  const  SizedBox(
      //   width:   double.infinity,
      //   child:  CancelButton(bookId: null,)
        
      //   )
        ],
       );
    }
    
  }
