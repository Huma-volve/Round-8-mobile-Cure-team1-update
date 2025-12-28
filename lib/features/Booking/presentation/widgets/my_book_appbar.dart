import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyBookAppbar extends StatelessWidget {
  const MyBookAppbar({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20.r),
          onTap: () {
            if (context.canPop()) {
              context.pop();
              return;
            }
            Navigator.of(context).maybePop();
          },
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: SizedBox(
              height: 24.r,
              width: 24.r,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.resourceImagesArrowImage),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 12.r,
        ),
        Expanded(
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.georgiaRegular24(context),
            ),
          ),
        ),
        SizedBox(
          width: 44.r,
        ),
      ],
    );
  }
}
