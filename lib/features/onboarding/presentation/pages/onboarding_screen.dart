import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/onboarding/data/onboarding_model.dart';
import 'package:cure_team_1_update/features/onboarding/presentation/pages/widgets/onboarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboaedingScreen extends StatefulWidget {
  const OnboaedingScreen({super.key});

  @override
  State<OnboaedingScreen> createState() => _OnboaedingScreenState();
}

class _OnboaedingScreenState extends State<OnboaedingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRoute.loginPage);
              },
              child: Text(
                'Skip',
                style: AppTextStyles.styleMedium16(context),
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: OnboardingModel.onboardingView.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingViewBody(
                  screen: OnboardingModel.onboardingView[index],
                  pageController: pageController,
                  currentIndex: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
