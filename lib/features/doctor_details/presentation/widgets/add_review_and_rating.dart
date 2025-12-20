import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/add_review.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddReviewAndRating extends StatelessWidget {
  const AddReviewAndRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AddReview(),
        SizedBox(
          height: 24.h,
        ),
        const Rating()
      ],
    );
  }
}
