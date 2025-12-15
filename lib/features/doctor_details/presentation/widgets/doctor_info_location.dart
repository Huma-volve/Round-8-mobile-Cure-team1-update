
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorInfoLocation extends StatelessWidget {
  const DoctorInfoLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 18.r,
          width: 18.r,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(Assets.resourceImagesLocation))),
        ),
        Text(
          '129,El-Nasr Street, Cairo ',
          style: AppTextStyles.montserratRegular14(context),
        ),
      ],
    );
  }
}
