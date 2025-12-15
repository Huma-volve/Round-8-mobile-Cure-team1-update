

import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBookingDoctorDetailsLocation extends StatelessWidget {
  const MyBookingDoctorDetailsLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       SizedBox(
         height: 20.h,
         width: 20.w,
         child: Image.asset(Assets.resourceImagesLocation,color: ColorsLight.blueGray,)),
        Text('129,El-Nasr Street, Cairo, Egypt ',style: AppTextStyles.montserratRegular14(context),),
      ],
    );
  }
}