import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_1_update/core/constants/go_route.dart';
import 'package:overlay_support/overlay_support.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return OverlaySupport.global(
            child: MaterialApp.router(
                title: 'cure_team_1',
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  primarySwatch: Colors.blue,
                  useMaterial3: true,
                ),
                debugShowCheckedModeBanner: false,
                routerConfig: Approutes.router),
          );
        });
  }
}
