import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/rating_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Rating extends StatefulWidget {
  const Rating({
    super.key,
  });

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double rate = 4.5;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$rate/5',
          style: AppTextStyles.georgiaRegular40(context),
        ),
        const Spacer(),
        Column(
          children: [
            RatingLogic(rate: rate),
            SizedBox(
              height: 8.h,
            ),
            Row(
              children: [
                Text(
                  '1250+',
                  style: AppTextStyles.montserratMedum16(context),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  'Reviews',
                  style: AppTextStyles.montserratMedum16(context),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
