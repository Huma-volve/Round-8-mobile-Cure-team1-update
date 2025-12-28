import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentDisplayRate extends StatelessWidget {
  const CommentDisplayRate({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    final ratingLabel = rating > 0 ? rating.toStringAsFixed(1) : '--';
    return Padding(
      padding: EdgeInsets.only(right: 8.r),
      child: Container(
        //  height: 32.h,
        // width: 61.w,
        decoration: BoxDecoration(
            color: ColorsLight.lightGreen,
            borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.r, vertical: 12.r),
          child: Row(
            children: [
              SizedBox(
                  width: 20.r,
                  height: 20.r,
                  child: Image.asset(Assets.resourceImagesActiveStar)),
              SizedBox(
                width: 2.r,
              ),
              Text(
                ratingLabel,
                style: AppTextStyles.plusJakartaSansbold16(context)
                    .copyWith(color: ColorsLight.vividYellow),
              )
            ],
          ),
        ),
      ),
    );
  }
}
