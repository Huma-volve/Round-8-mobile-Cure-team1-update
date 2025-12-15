
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/doctor_details/data/models/review_and_rating_section_model.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/review_and_rating_section_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewAndRatingSection extends StatelessWidget {
  const ReviewAndRatingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         SizedBox(
          width: 58.w,
          child: ReviewAndRatingSectionItem(reviewAndRatingSectionModel: ReviewAndRatingSectionModel(image: Assets.resourceImagesProfile2user, data: 2.000, title: 'patients'),)),
       const  Spacer(),
        SizedBox( 
            width: 78.w,
           child: ReviewAndRatingSectionItem(reviewAndRatingSectionModel: ReviewAndRatingSectionModel(image: Assets.resourceImagesExperiance, data: 10, title: 'experience'),)),
    
       const  Spacer(),
       SizedBox(
          width: 55.91.w,
        child: ReviewAndRatingSectionItem(reviewAndRatingSectionModel: ReviewAndRatingSectionModel(image: Assets.resourceImagesStar, data: 4.5, title: 'rating'),)),
           const  Spacer(),
        SizedBox(
            width: 56.w,
          child: ReviewAndRatingSectionItem(reviewAndRatingSectionModel: ReviewAndRatingSectionModel(image: Assets.resourceImagesReviews, data: 1.872, title: 'reviews'),)),
    
    
       
      ],
    );
  }
}
