import 'package:cure_team_1_update/core/common/widgets/custom_app_bar.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
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
                  style: StyleTextHelper.textStyle20Regular(context),
                  children: [
                    TextSpan(
                      text: '19/11/2024',
                      style:
                          StyleTextHelper.textStyle20Regular(context).copyWith(
                        color: ColorsLight.blueGray,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              RichText(
                text: TextSpan(
                  text: 'Welcome to Cure. Your privacy is important to us.\n\n',
                  style: StyleTextHelper.textStyle18Regular(context),
                  children: [
                    TextSpan(
                      text:
                          ' This Privacy Policy explains how we collect, use, \n   .and protect your personal information when you\n   .use our doctor appointment booking app.\n\n',
                      style: StyleTextHelper.textStyle18Regular(context),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Text('terms & conditions',
                  style: StyleTextHelper.textStyle20Regular(context)),
              SizedBox(height: 16.h),
              Text(
                '   By registering, accessing, or using this app, you confirm that you are at least 18 years old (or have parental/guardian consent if younger) and agree to be bound by these Terms and our Privacy Policy.\n\nYou agree to:\n\u2022 Use the app only for lawful purposes.\n\u2022 Provide accurate and complete information during registration and booking.\n\u2022 Not impersonate others or create fake accounts.\n\nYou may not:\n\u2022 Disrupt or interfere with the app\'s functionality.\n\u2022 Try to access data or systems not meant for you.\n\u2022 Use the app to harass or abuse doctors or staff.\n\nYour data is handled in accordance with our [Privacy Policy]. You are responsible for keeping your login credentials secure.',
                style: StyleTextHelper.textStyle18Regular(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
