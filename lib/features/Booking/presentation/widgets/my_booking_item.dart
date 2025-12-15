

import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/features/Booking/data/models/myBooking_model.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/booking_action_button.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/booking_option_button.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/custom_divider.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_item_doctor_details.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_item_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyBookingItem extends StatelessWidget {
  const MyBookingItem({
    super.key, required this.mybookingModel,
  });
final MybookingModel mybookingModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        context.push(AppRoute.myBookingitemSsceen,extra: mybookingModel);
      },
      child: Container(
       
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 3,color: ColorsLight.offWhite),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding:  EdgeInsets.only(top: 13.h,bottom: 16.h,left: 16.w,right: 16.w),
          child:  Column(
            children: [
              MyBookingItemHeader(bookingStatus: mybookingModel.bookingStatus, isUpcomingStatus: mybookingModel.isUpcomingStatus,),
            const  CustomDivivder(),
      
          const  MyBookingItemDoctorDetails(),
            SizedBox(height: 16.r,),
            Row(
              children: [
                Expanded(child: BookingActionButton(bottonName: mybookingModel.buttonActionName, isCnaceledButton: mybookingModel.isCnaceledButton,)),
                SizedBox(width: 24.r,),
                Expanded(child: BookingOptionButton(bottonName: mybookingModel.buttonOptionName))
              ],
            ),
      
            ],
          ),
        ),
      ),
    );
  }
}


