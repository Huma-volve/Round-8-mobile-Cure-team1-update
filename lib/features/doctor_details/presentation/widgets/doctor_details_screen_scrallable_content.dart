
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/about_me_section.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/add_review_and_rating.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/comment_desplay.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_screen_appbar.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_widget.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/review_and_rating_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsScreenScrollableContent extends StatelessWidget {
  const DoctorDetailsScreenScrollableContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.symmetric(horizontal: 16.r),
  child:    ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.r,),
            const DoctorDetailsAppBar(title:  'Doctor Details',),
            const DoctorDetailsWidget(),
           SizedBox(height: 16.r,),
           const ReviewAndRatingSection(),
           SizedBox(height: 41.r,),
           const AboutMeSection(),
            SizedBox(height: 24.r,),
           const AddReviewAndRating(),
           SizedBox(height: 24.r,),
           const   CommentDesplay(),
           SizedBox(height:150.r),
          ],
        ),
      ],
    ));
  }
}