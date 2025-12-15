
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/Booking/data/models/myBooking_model.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/date_time_widget.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookinScreenBody extends StatelessWidget {
  const MyBookinScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'My Booking',
                style: AppTextStyles.georgiaRegular20(context),
              ),
            ),
             SizedBox(
              height: 24.h,
            ),
           const  DateTimeWidge(),
            SizedBox(
              height: 20.h,
            ),
            MyBookingItem(
              mybookingModel: MybookingModel(
                  bookingStatus: 'Upcoming',
                  buttonActionName: 'Cancel',
                  buttonOptionName: 'Reschedule',
                  isUpcomingStatus: true,
                  isCnaceledButton: true),
            ),
            SizedBox(
              height: 16.h,
            ),
            MyBookingItem(
              mybookingModel: MybookingModel(
                  bookingStatus: 'Completed',
                  buttonActionName: 'Book again',
                  buttonOptionName: 'Feedback'),
            ),
            
            SizedBox(
              height: 16.h,
            ),
            MyBookingItem(
              mybookingModel: MybookingModel(
                  bookingStatus: 'Canceled',
                  buttonActionName: 'Book again',
                  buttonOptionName: 'Support'),
            ),
          ],
        ),
      ],
    );
  }
}

