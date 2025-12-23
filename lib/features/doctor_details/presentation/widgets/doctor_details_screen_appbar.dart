import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DoctorDetailsAppBar extends StatelessWidget {
  const DoctorDetailsAppBar({
    super.key,
    required this.title,
    this.ismessageIconEnable = false,
  });
  final String title;
  final bool ismessageIconEnable;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Container(
            height: 24.h,
            width: 24.w,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.resourceImagesArrowImage))),
          ),
        ),
        const Spacer(),
        Text(
          title,
          style: AppTextStyles.georgiaRegular24(context),
        ),
        const Spacer(),
        Visibility(
            visible: ismessageIconEnable,
            child: Image.asset(Assets.resourceImagesMessage)),
      ],
    );
  }
}
