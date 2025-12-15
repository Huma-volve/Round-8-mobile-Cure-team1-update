

import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingOptionButton extends StatelessWidget {
  const BookingOptionButton({
    super.key, required this.bottonName,
  });
final String bottonName;
  @override
  Widget build(BuildContext context) {
    return Container(
          height: 40.h,
        
          decoration: BoxDecoration(
            color: ColorsLight.royalBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            
            child: Text(bottonName,style: AppTextStyles.montserratRegular14(context).copyWith(color: Colors.white),
              ),
          ),
        );
  }
}