import 'package:cure_team_1_update/core/constants/go_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
          375, 812), // You can adjust this based on your design specs
      minTextAdapt: true,

      splitScreenMode: true,
      builder: (_ , child) {
           return MaterialApp.router(
        title: 'cure_team_1',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
         
         routerConfig: Approutes.router
      );
      }
    );
  }
}
