
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/custom_text_fild.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_screen_appbar.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/rating_with_star.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/send_your_review_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddReviewScreenBody extends StatefulWidget {
  const AddReviewScreenBody({super.key});

  @override
  State<AddReviewScreenBody> createState() => _AddReviewScreenBodyState();
}

class _AddReviewScreenBodyState extends State<AddReviewScreenBody> {
 
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          SizedBox(height: 24.h,),
          const DoctorDetailsAppBar(title: 'Review',ismessageIconEnable: false,),
          SizedBox(height: 33.h,),
          
          Text('Your Rate',style: AppTextStyles.georgiaRegular16(context),),
          SizedBox(height: 19.h,),
              Row(
          children: [
            const RatingWithStar(),
            const Spacer(),
            Text('4/5',style: AppTextStyles.georgiaRegular40(context),),
            
          ],
              ),
               SizedBox(height: 56.h,),
              Text('Your review',style: AppTextStyles.georgiaRegular20(context),),
              SizedBox(height: 21.h,),
         const   CustomTextFild(),
          SizedBox(height: 257.h,),
         const SendYourReviewButton(),
      
    
        ],
      ),
    ]));
  }

 
  
}
