
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyBookAppbar extends StatelessWidget {
  const MyBookAppbar({
    super.key, required this.title,
  });
final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
          context.pop();
          },
          child: Container(
            height: 24.r,
            width: 24.r,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(Assets.resourceImagesArrowImage))),
          ),
        ),
        SizedBox(width: 77.r,),
        Text(
         title,
          style: AppTextStyles.georgiaRegular24(context),
        ),
        
      ],
    );
  }
}
