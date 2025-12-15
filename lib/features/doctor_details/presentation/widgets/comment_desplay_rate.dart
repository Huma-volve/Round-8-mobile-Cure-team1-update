

import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentDisplayRate extends StatelessWidget {
  const CommentDisplayRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 8.w),
      child: Container(
      //  height: 32.h,
      // width: 61.w,
      decoration: BoxDecoration(
       color: ColorsLight.lightGreen,
       borderRadius: BorderRadius.circular(6)
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 14.w,vertical: 12.h),
        child: Row(
         children: [
          
         SizedBox(
          width: 20.w,
          height: 20.h,
          child: Image.asset(Assets.resourceImagesActiveStar)),
          SizedBox(width: 2.w,),
         Text('4.5',style: AppTextStyles.plusJakartaSansbold16(context).copyWith(color: ColorsLight.vividYellow),)
        ],),
      ),
      ),
    );
  }
}