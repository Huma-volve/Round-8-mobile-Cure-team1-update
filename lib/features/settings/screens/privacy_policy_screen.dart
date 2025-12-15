import 'package:cure_team_1_update/core/common/widgets/custom_app_bar.dart';
import 'package:cure_team_1_update/core/common/widgets/custome_appbar.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsLight.scaffoldBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: CustomAppBar(
            title: 'Privacy Policy',
            onPressed: () {
              GoRouter.of(context).canPop() ? GoRouter.of(context).pop() : null;
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(18.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Last Updated: ',
                  style: AppTextStyles.styleLarge8,
                  children: [
                    TextSpan(
                      text: '19/11/2024',
                      style: AppTextStyles.styleLarge6.copyWith(
                        color: ColorsLight.blueGray,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Welcome to Cure. Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your personal information when you use our doctor appointment booking app.',
                style: AppTextStyles.styleSmall6,
              ),
              SizedBox(height: 24.h),
              Text('terms & conditions', style: AppTextStyles.styleLarge8),
              SizedBox(height: 16.h),
              Text(
                'By registering, accessing, or using this app, you confirm that you are at least 18 years old (or have parental/guardian consent if younger) and agree to be bound by these Terms and our Privacy Policy.\n\nYou agree to:\n\u2022 Use the app only for lawful purposes.\n\u2022 Provide accurate and complete information during registration and booking.\n\u2022 Not impersonate others or create fake accounts.\n\nYou may not:\n\u2022 Disrupt or interfere with the app\'s functionality.\n\u2022 Try to access data or systems not meant for you.\n\u2022 Use the app to harass or abuse doctors or staff.\n\nYour data is handled in accordance with our [Privacy Policy]. You are responsible for keeping your login credentials secure.',
                style: AppTextStyles.styleSmall6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
