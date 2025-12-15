import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreditCardWidget extends StatelessWidget {
  final String cardNumber; // e.g. "6789 4567 5432 8903"
  final String cardHolder;
  final String expiryDate; // e.g. "12/22"
  final Color startColor;
  final Color endColor;

  const CreditCardWidget({
    super.key,
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
    this.startColor = const Color(0xFF00C9FF), // Cyan-ish
    this.endColor = const Color(0xFF92FE9D), // Green-ish
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF00C6FF),
            Color(0xFF0072FF),
          ], // Blue gradient matching design more closely
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                  Assets.profileGroupAddCard), // Placeholder for "Spenny" logo
              Text(
                'VISA',
                style: AppTextStyles.styleLarge18(context),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          // Chip icon placeholder
          Container(
            width: 40.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            cardNumber,
            style: AppTextStyles.styleLarge18(context),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cardHolder.toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              Text(
                expiryDate,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
