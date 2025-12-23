import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/custom_elevated_button.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceAndBookActionFooterButton extends StatelessWidget {
  const PriceAndBookActionFooterButton({
<<<<<<< HEAD
    super.key,
    required this.buttonName,
    this.onPressed,
  });
  final String buttonName;
  final Function()? onPressed;
=======
    super.key, required this.buttonName, this.onPressed,this.loadingState=false
  });
final String buttonName;
final  Function()? onPressed;
final bool loadingState;
>>>>>>> shaban
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Card(
<<<<<<< HEAD
        elevation: 10,
        child: SizedBox(
          height: 144.r,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: 17.r, left: 24.r, right: 24.r),
            child: Column(
              children: [
                const PriceWidget(),
                SizedBox(
                  height: 15.r,
                ),
                CustomElevatedButton(
                  onPressed: onPressed,
                  buttonName: buttonName,
                )
              ],
            ),
=======
       elevation: 10,
        child: Container(
         height: 144.r,
         width: double.infinity,
        child: Padding(
          padding:  EdgeInsets.only(top: 17.r,left: 24.r,right: 24.r),
          child: Column(
           children: [
         const    PriceWidget(),
         SizedBox(height: 15.r,),
              CustomElevatedButton(onPressed:  onPressed, buttonName: buttonName,loadingState: loadingState,)      
           ],
>>>>>>> shaban
          ),
        ),
      ),
    );
  }
}
