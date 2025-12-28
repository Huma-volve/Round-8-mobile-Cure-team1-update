import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddReview extends StatelessWidget {
  const AddReview({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Reviews and Rating',
          style: AppTextStyles.georgiaRegular20(context),
        ),
        const Spacer(),
        SizedBox(
            width: 20.r,
            height: 20.r,
            child: Image.asset(Assets.resourceImagesAddReview)),
        SizedBox(
          width: 5.r,
        ),
        TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.zero),
          onPressed: onPressed ??
              () {
                context.go(AppRoute.addReviewScreen);
              },
          child: Text(
            'add review',
            style: AppTextStyles.montserratRegular14(context)
                .copyWith(color: ColorsLight.royalBlue),
          ),
        )
      ],
    );
  }
}
