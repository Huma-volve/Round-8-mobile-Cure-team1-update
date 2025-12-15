

import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookingItemHeader extends StatelessWidget {
  const MyBookingItemHeader({
    super.key, required this.bookingStatus, required this.isUpcomingStatus,
  });
final String bookingStatus;
final bool isUpcomingStatus;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.resourceImagesCalendar02,color: Colors.black,),
        SizedBox(width: 4.w,),
        Text('Monday, July 21 - 11:00 Am',style: AppTextStyles.montserratRegular12(context)),
       const Spacer(),
        Text(bookingStatus,style: AppTextStyles.montserratRegular14(context).copyWith(color:isUpcomingStatus? ColorsLight.royalBlue:Colors.red),)
      ],
    );
  }
}