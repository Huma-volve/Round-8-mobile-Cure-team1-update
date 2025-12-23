
import 'package:cure_team_1_update/core/constants/app_route.dart';

import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class BookagainBottun extends StatelessWidget {
  const BookagainBottun({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoute.bookappointment);
      },
      child: 
       Container(
        height: 40.r,
    
        decoration: BoxDecoration(
          border: Border.all(color :ColorsLight.royalBlue,),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text('Book again',style: AppTextStyles.montserratRegular14(context).copyWith(color: ColorsLight.royalBlue),))),
    
    
    );
  }
}
