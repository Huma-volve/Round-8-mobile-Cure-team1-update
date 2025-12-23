import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/custom_divider.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/function/get_button_based_on_booking_status.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_item_doctor_details.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_item_header.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookingItem extends StatelessWidget {
  const MyBookingItem({
    super.key,
    required this.mybookItem,
  });
  final MyBookingEntity mybookItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: ColorsLight.offWhite),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding:
            EdgeInsets.only(top: 13.h, bottom: 16.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            MyBookingItemHeader(
              bookingStatus: mybookItem.bookingStatus,
            ),
            const CustomDivivder(),
            MyBookingItemDoctorDetails(
              mybookItem: mybookItem,
            ),
            SizedBox(
              height: 16.r,
            ),
            getbuttonBasedOnBookingStatus(
                  bookingStatus: mybookItem.bookingStatus,
                  bookId: mybookItem.bookId),
            
          ],
        ),
      ),
    );
  }
}
