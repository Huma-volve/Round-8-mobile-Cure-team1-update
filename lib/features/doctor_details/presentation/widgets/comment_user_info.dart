import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/comment_desplay_rate.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/comment_user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentUserInfo extends StatelessWidget {
  const CommentUserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CommentUserImage(),
        SizedBox(
          width: 9.52.r,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nabila Reyna',
              style: AppTextStyles.georgiaRegular16(context),
            ),
            Text(
              '30 min ago',
              style: AppTextStyles.georgiaRegular16(context),
            ),
          ],
        ),
        const Spacer(),
        const CommentDisplayRate(),
      ],
    );
  }
}
