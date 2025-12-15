import 'dart:async';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<bool> dotVisible = [true, false, false, false];
  int activeIndex = 0;
  Timer? _timer;
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        activeIndex = (activeIndex + 1) % 4;
      });
    });

    Future.delayed(const Duration(seconds: 3), () async {
      if (!mounted) return;
      GoRouter.of(context).go(AppRoute.loginPage);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLight.primaryColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(
              Assets.resourceImagesIconSplash,
              width: 0.18.sw,
              height: 0.18.sw,
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 0.08.sh,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 4,
              effect: ScaleEffect(
                activeDotColor: Colors.white,
                dotColor: Colors.white.withAlpha((255 * 0.6).round()),
                dotWidth: 0.025.sw,
                dotHeight: 0.025.sw,
                radius: 0.025.sw,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
