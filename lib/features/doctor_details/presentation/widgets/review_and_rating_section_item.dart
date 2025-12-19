import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/doctor_details/data/models/review_and_rating_section_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewAndRatingSectionItem extends StatelessWidget {
  const ReviewAndRatingSectionItem({
    super.key,
    required this.reviewAndRatingSectionModel,
  });
  final ReviewAndRatingSectionModel reviewAndRatingSectionModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98.r,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 30.55.r,
                width: 30.55.r,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(reviewAndRatingSectionModel.image))),
              ),
              SizedBox(
                height: 14.r,
              ),
              Text(
                reviewAndRatingSectionModel.data.toString(),
                style: AppTextStyles.georgiaSemiBold14(context),
              ),
              Text(
                reviewAndRatingSectionModel.title,
                style: AppTextStyles.montserratRegular14(context),
              ),
            ],
          )
        ],
      ),
    );
  }
}
