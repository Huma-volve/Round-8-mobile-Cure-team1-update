import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/add_new_card_widget.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/appointment_and_reschedual_widge.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_screen_appbar.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_widget.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/payment_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectPaymentMethodScreenScrollableContent extends StatelessWidget {
  const SelectPaymentMethodScreenScrollableContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              const DoctorDetailsAppBar(
                title: 'Book Appointment',
                ismessageIconEnable: false,
              ),
              SizedBox(
                height: 35.h,
              ),
              const DoctorDetailsWidget(),
              SizedBox(
                height: 32.h,
              ),
              const ApointMentAndReschedualWidget(),
              SizedBox(
                height: 49.h,
              ),
              const PaymentMethodItems(),
              SizedBox(
                height: 8.h,
              ),
              const AddNewCardWidge()
            ],
          ),
        ),
      ],
    );
  }
}
