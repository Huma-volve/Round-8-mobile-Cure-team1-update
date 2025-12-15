import 'package:cure_team_1_update/core/common/widgets/custome_appbar.dart';
import 'package:cure_team_1_update/core/common/widgets/custome_button.dart';
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/auth/otp/presentation/pages/widgets/otp_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          const CustomeAppbar(title: 'OTP Code Verification'),
          SizedBox(
            height: 70.h,
          ),
          Text(
            'Code has been send to +02 010 *** **88',
            style: AppTextStyles.styleMedium16(context),
          ),
          OtpItem(),
          Column(
            children: [
              Text(
                'Wrong code',
                style: AppTextStyles.styleLarge16(context)
                    .copyWith(color: Colors.red),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend',
                      style: AppTextStyles.styleLarge16(context)
                          .copyWith(color: ColorsLight.primaryColor),
                    ),
                  ),
                  Text(
                    'or',
                    style: AppTextStyles.styleLarge16(context),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Enter another phone number',
                      style: AppTextStyles.styleLarge16(context)
                          .copyWith(color: ColorsLight.primaryColor),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 60.h,
          ),
          CustomeButton(
              text: 'Verify',
              color: ColorsLight.primaryColor,
              onTap: () {
                GoRouter.of(context).pushReplacement(AppRoute.home);
              })
        ],
      ),
    );
  }
}
