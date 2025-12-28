import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/add_review.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddReviewAndRating extends StatelessWidget {
  const AddReviewAndRating({
    super.key,
    this.rating,
    this.reviewsCount,
    this.onAddReview,
  });

  final double? rating;
  final int? reviewsCount;
  final VoidCallback? onAddReview;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddReview(onPressed: onAddReview),
        SizedBox(
          height: 24.h,
        ),
        Rating(
          rating: rating,
          reviewsCount: reviewsCount,
        )
      ],
    );
  }
}
