


import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_doctor_details_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookingItemDoctorDetails extends StatelessWidget {
  const MyBookingItemDoctorDetails({
    super.key,required this.mybookItem
  });
final MyBookingEntity mybookItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     Row(
        children: [
          Container(
            height: 41.h,
            width: 43.w,
            decoration: BoxDecoration(
             image:const DecorationImage(image: AssetImage(Assets.resourceImagesDoctor)),
              borderRadius: BorderRadius.circular(35)
            ),
          )
       ,SizedBox(width: 8.r,)
      , Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(mybookItem.docName,style: AppTextStyles.georgiaRegular16(context),),
           Text(mybookItem.docSpciality,style: AppTextStyles.montserratRegular14(context),),
        ],
       )
       ,
     
        ],
      ),
      SizedBox(height: 8.r,),
       MyBookingDoctorDetailsLocation(docAddress: mybookItem.docAddress,)
      ],
    );
  }
}
