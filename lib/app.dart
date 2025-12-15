import 'package:cure_team_1_update/features/profile/screens/profile_screen.dart';
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
      child: MaterialApp(
        title: 'cure_team_1',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: Container(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
