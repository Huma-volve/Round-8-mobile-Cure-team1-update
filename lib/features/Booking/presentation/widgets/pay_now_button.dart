import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/Home/Data/models/api_doctor.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/models/booking_flow_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PayNowButton extends StatelessWidget {
  const PayNowButton({super.key, required this.booking});

  final MyBookingEntity booking;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final doctor = ApiDoctor(
          id: booking.docId,
          name: booking.docName,
          specialty: booking.docSpciality,
          address: booking.docAddress,
          clinicAddress: booking.docAddress,
          profilePhoto: booking.docImage,
          rating: 0.0,
          isFavorite: false,
          latitude: null,
          longitude: null,
          aboutMe: '',
          experienceYears: null,
          sessionPrice: booking.price,
        );
        final data = BookingFlowData(
          doctor: doctor,
          bookingId: booking.bookId,
          appointmentDate: booking.bookDate,
          appointmentTime: booking.bookHour,
        );
        context.push(AppRoute.selectPaymentMethodScreen, extra: data);
      },
      child: Container(
        height: 40.r,
        decoration: BoxDecoration(
          color: ColorsLight.royalBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Pay Now',
            style: AppTextStyles.montserratRegular14(context)
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
