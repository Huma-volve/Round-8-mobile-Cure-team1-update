
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/custom_elevated_button.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PriceAndBookActionFooterButton extends StatelessWidget {
  const PriceAndBookActionFooterButton({
    super.key, required this.buttonName, this.onPressed,
  });
final String buttonName;
final  Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Positioned(
     bottom: 0,
     left: 0,
     right: 0,
      child: Card(
       elevation: 10,
        child: Container(
         height: 144,
         width: double.infinity,
        child: Padding(
          padding:  EdgeInsets.only(top: 17.h,left: 24.w,right: 24.w),
          child: Column(
           children: [
         const    PriceWidget(),
         SizedBox(height: 15.h,),
              CustomElevatedButton(onPressed:  onPressed, buttonName: buttonName,)      
           ],
          ),
        ),
        ),
      ),
    );
  }
}