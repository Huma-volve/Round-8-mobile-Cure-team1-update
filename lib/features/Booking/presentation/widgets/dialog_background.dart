import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogBackground extends StatelessWidget {
  const DialogBackground({
    super.key,
    required this.isCnaceledButton,
    required this.bottonName,
  });

  final bool isCnaceledButton;
  final String bottonName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            width: 2.r,
            color: isCnaceledButton
                ? ColorsLight.blueGray
                : ColorsLight.royalBlue),
      ),
      child: Center(
        child: Text(
          bottonName,
          style: AppTextStyles.montserratRegular14(context).copyWith(
              color: isCnaceledButton
                  ? ColorsLight.blueGray
                  : ColorsLight.royalBlue),
        ),
      ),
    );
  }
}
