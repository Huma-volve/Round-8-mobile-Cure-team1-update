import 'package:cure_team_1_update/core/common/widgets/custome_button.dart';
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/onboarding/data/onboarding_model.dart';
import 'package:cure_team_1_update/features/onboarding/presentation/pages/widgets/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody(
      {super.key,
      required this.screen,
      required this.pageController,
      required this.currentIndex});
  final OnboardingModel screen;
  final PageController pageController;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final isLastPage =
        currentIndex == OnboardingModel.onboardingView.length - 1;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const Spacer(flex: 1),
          Center(
            child: Image.asset(
              screen.image,
            ),
          ),
          const Spacer(flex: 1),
          Text(
            screen.title,
            style: AppTextStyles.styleLarge24(context),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            screen.desc,
            style: AppTextStyles.styleMedium16(context),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
          OnboardingDots(currentIndex: currentIndex),
          const Spacer(
            flex: 3,
          ),
          CustomeButton(
              text: isLastPage ? 'Get Started' : 'Next',
              color: ColorsLight.primaryColor,
              onTap: () {
                if (isLastPage) {
                  Cachehelper.cacheOnboardingSeen(true);
                  GoRouter.of(context).pushReplacement(AppRoute.loginPage);
                } else {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                }
              }),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
