import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.buttonName,
      this.onPressed,
      this.loadingState = false});
  final String buttonName;
  final Function()? onPressed;
  final bool loadingState;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(410.r, 44.r),
            backgroundColor: ColorsLight.royalBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onPressed,
        child: loadingState
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                buttonName,
                style: AppTextStyles.montserratMedum16(context)
                    .copyWith(color: Colors.white),
              ));
  }
}
