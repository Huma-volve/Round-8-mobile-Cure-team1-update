import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/doctor_details/data/models/doctor_reviews.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/comment_user_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentDesplay extends StatelessWidget {
  const CommentDesplay({
    super.key,
    required this.review,
  });

  final DoctorReview review;

  @override
  Widget build(BuildContext context) {
    final commentText =
        review.comment.isEmpty ? 'No review comment.' : review.comment;
    final doctorResponse = review.doctorResponse;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 1.r, color: ColorsLight.border),
          borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.r, horizontal: 12.r),
        child: Column(
          children: [
            CommentUserInfo(review: review),
            SizedBox(
              height: 9.r,
            ),
            Text(
              commentText,
              style: AppTextStyles.montserratMedum16(context),
            ),
            if (doctorResponse != null && doctorResponse.trim().isNotEmpty) ...[
              SizedBox(height: 10.r),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Doctor response:',
                  style: AppTextStyles.montserratMedum14(context)
                      .copyWith(color: ColorsLight.coolGrey),
                ),
              ),
              SizedBox(height: 4.r),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  doctorResponse,
                  style: AppTextStyles.montserratMedum16(context),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
