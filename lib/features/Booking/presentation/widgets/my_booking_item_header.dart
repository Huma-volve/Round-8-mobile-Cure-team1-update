import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/Booking/domain/enums/booking_enum.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/function/captlize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookingItemHeader extends StatelessWidget {
  const MyBookingItemHeader({
    super.key, required this.bookingStatus,
  });
final BookingEnum bookingStatus;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.resourceImagesCalendar02,color: Colors.black,),
        SizedBox(width: 4.w,),
        Text('Monday, July 21 - 11:00 Am',style: AppTextStyles.montserratRegular12(context)),
       const Spacer(),
        Text(captilize(bookingStatus.name),style: AppTextStyles.montserratRegular14(context).copyWith(color:bookingStatus == BookingEnum.upcoming  ? ColorsLight.royalBlue:Colors.red),)
      ],
    );
  }
  
}
