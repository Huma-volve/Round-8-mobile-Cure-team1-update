import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/rating_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Rating extends StatefulWidget {
  const Rating({
    super.key,
    this.rating,
    this.reviewsCount,
  });

  final double? rating;
  final int? reviewsCount;

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    final rate = widget.rating ?? 0;
    final ratingLabel =
        widget.rating != null ? rate.toStringAsFixed(1) : '--';
    final reviewsLabel = widget.reviewsCount != null
        ? _formatCount(widget.reviewsCount!,
            addPlus: widget.reviewsCount! >= 1000)
        : '--';
    return Row(
      children: [
        Text(
          '$ratingLabel/5',
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
                  reviewsLabel,
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
