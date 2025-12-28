import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Customabppar extends StatelessWidget {
  const Customabppar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Chat',
          style: AppTextStyles.georgiaRegular24(context),
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(
            Assets.resourceImagesDot,
            width: 24.w,
            height: 24.h,
          ),
        ),
      ],
    );
  }
}
