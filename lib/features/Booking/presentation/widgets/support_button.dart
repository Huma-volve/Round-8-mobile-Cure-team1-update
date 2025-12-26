
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SupportButton extends StatelessWidget {
  const SupportButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child:Container(
        height: 40.r,
  
        decoration: BoxDecoration(
          color:ColorsLight.royalBlue,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text('Support',style: AppTextStyles.montserratRegular14(context).copyWith(color: Colors.white),))),
    );
  }
}
