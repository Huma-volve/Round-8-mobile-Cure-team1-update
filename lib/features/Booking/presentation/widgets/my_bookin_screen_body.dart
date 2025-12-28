import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/date_time_widget.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_screen_body_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookinScreenBody extends StatefulWidget {
  const MyBookinScreenBody({super.key});

  @override
  State<MyBookinScreenBody> createState() => _MyBookinScreenBodyState();
}

class _MyBookinScreenBodyState extends State<MyBookinScreenBody> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.r,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              'My Booking',
              style: AppTextStyles.georgiaRegular20(context),
            ),
          ),
          SizedBox(
            height: 16.r,
          ),
          DateTimeWidge(
            initialSelectedDate: _selectedDate,
            onDateSelected: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
          ),
          SizedBox(
            height: 12.r,
          ),
          MyBookingScreenBodyBlocConsumer(selectedDate: _selectedDate)
        ],
      ),
    );
  }
}
