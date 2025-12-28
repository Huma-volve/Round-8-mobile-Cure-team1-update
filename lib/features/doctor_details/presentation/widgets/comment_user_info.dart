import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/doctor_details/data/models/doctor_reviews.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/comment_desplay_rate.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/comment_user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentUserInfo extends StatelessWidget {
  const CommentUserInfo({
    super.key,
    required this.review,
  });

  final DoctorReview review;

  @override
  Widget build(BuildContext context) {
    final rawName = review.patient?.name ?? '';
    final patientName = rawName.trim().isEmpty ? 'Anonymous' : rawName;
    final createdAt = review.createdAt ?? 'Recently';
    return Row(
      children: [
        CommentUserImage(imageUrl: review.patient?.photo),
        SizedBox(
          width: 9.52.r,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              patientName,
              style: AppTextStyles.georgiaRegular16(context),
            ),
            Text(
              createdAt,
              style: AppTextStyles.georgiaRegular16(context),
            ),
          ],
        ),
        const Spacer(),
        CommentDisplayRate(rating: review.rating),
      ],
    );
  }
}
