
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/models/add_review_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class FeedBackButton extends StatelessWidget {
  const FeedBackButton({
    super.key,
    required this.booking,
  });
  final MyBookingEntity booking;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRoute.addReviewScreen,
          extra: AddReviewArgs(
            bookingId: booking.bookId,
            doctorId: booking.docId,
          ),
        );
      },
      child:      Container(
        height: 40.r,
        
        decoration: BoxDecoration(
          color:ColorsLight.royalBlue,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text('Feedback',style: AppTextStyles.montserratRegular14(context).copyWith(color: Colors.white),))),
    
    );
  }
}
