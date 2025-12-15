
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';


class AddNewCardWidge extends StatelessWidget {
  const AddNewCardWidge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Container(
        height: 48.h,
        width: double.infinity,
        decoration:const BoxDecoration(
          border: DashedBorder.fromBorderSide(
                        dashLength: 15,
                        side: BorderSide(color: ColorsLight.royalBlue, width: 1)),
      
      
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                    
        
        child: Center(child: Text('+ Add new card',style: AppTextStyles.montserratMedum16(context).copyWith(color: ColorsLight.royalBlue),))
      ),
    );
  }
}