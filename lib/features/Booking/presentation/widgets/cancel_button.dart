
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/function/show_dialog_implement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialogImplement(context);
      },
      child:  Container(
        height: 40.r,
     
        decoration: BoxDecoration(
          border: Border.all(color :ColorsLight.blueGray,),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text('Cancel',style: AppTextStyles.montserratRegular14(context).copyWith(color: ColorsLight.blueGray),))),
    
    
    );
  }
}
