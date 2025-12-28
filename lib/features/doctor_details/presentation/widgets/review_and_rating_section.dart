import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/doctor_details/data/models/review_and_rating_section_model.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/review_and_rating_section_item.dart';
import 'package:flutter/material.dart';

class ReviewAndRatingSection extends StatelessWidget {
  final int? experienceYears;
  final double? rating;
  const ReviewAndRatingSection({
    super.key,
    this.experienceYears,
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final experienceLabel =
        experienceYears != null ? '${experienceYears!}+' : '--';
    final ratingLabel =
        rating != null ? rating!.toStringAsFixed(1) : '--';
    final patientsLabel = _formatCount(2000, addPlus: true);
    final reviewsLabel = _formatCount(1872);

    return Row(
      children: [
        Expanded(
          child: ReviewAndRatingSectionItem(
            reviewAndRatingSectionModel: ReviewAndRatingSectionModel(
              image: Assets.resourceImagesProfile2user,
              data: 2000,
              title: 'patients',
              displayValue: patientsLabel,
            ),
          ),
        ),
        Expanded(
          child: ReviewAndRatingSectionItem(
            reviewAndRatingSectionModel: ReviewAndRatingSectionModel(
              image: Assets.resourceImagesExperiance,
              data: experienceYears?.toDouble() ?? 0,
              title: 'experience',
              displayValue: experienceLabel,
            ),
          ),
        ),
        Expanded(
          child: ReviewAndRatingSectionItem(
            reviewAndRatingSectionModel: ReviewAndRatingSectionModel(
              image: Assets.resourceImagesStar,
              data: rating ?? 0,
              title: 'rating',
              displayValue: ratingLabel,
            ),
          ),
        ),
        Expanded(
          child: ReviewAndRatingSectionItem(
            reviewAndRatingSectionModel: ReviewAndRatingSectionModel(
              image: Assets.resourceImagesReviews,
              data: 1872,
              title: 'reviews',
              displayValue: reviewsLabel,
            ),
          ),
        ),
      ],
    );
  }
}

String _formatCount(int value, {bool addPlus = false}) {
  final text = value.toString();
  final buffer = StringBuffer();
  for (int i = 0; i < text.length; i++) {
    final reverseIndex = text.length - i;
    buffer.write(text[i]);
    if (reverseIndex > 1 && reverseIndex % 3 == 1) {
      buffer.write(',');
    }
  }
  return addPlus ? '${buffer.toString()}+' : buffer.toString();
}
