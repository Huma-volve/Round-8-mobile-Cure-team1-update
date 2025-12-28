
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/Home/Data/models/api_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookagainBottun extends StatelessWidget {
  const BookagainBottun({
    super.key,
    required this.booking,
  });

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
        context.push(AppRoute.bookappointment, extra: doctor);
      },
      child: 
       Container(
        height: 40.r,
    
        decoration: BoxDecoration(
          border: Border.all(color :ColorsLight.royalBlue,),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text('Book again',style: AppTextStyles.montserratRegular14(context).copyWith(color: ColorsLight.royalBlue),))),
    
    
    );
  }
}
