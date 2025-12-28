
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class ReschedualButton extends StatelessWidget {
  const ReschedualButton({
    super.key, required this.booking,
    
  });
final MyBookingEntity booking;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoute.updateMyBookingSceen,extra: booking);
      },
      child: Container(
        height: 40.r,
       
        decoration: BoxDecoration(
          color:ColorsLight.royalBlue,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text('Reschedule',style: AppTextStyles.montserratRegular14(context).copyWith(color: Colors.white),))),
    );
  }
}
