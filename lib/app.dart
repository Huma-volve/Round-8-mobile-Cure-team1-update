import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/auth/login/presentation/manage/login_cubit.dart';
import 'package:cure_team_1_update/features/auth/otp/presentation/manage/otp_cubit.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/cubit/chat_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_1_update/core/constants/go_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(
            375, 812), // You can adjust this based on your design specs
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<ChatCubit>(
                create: (_) => getit.get<ChatCubit>(),
              ),
              BlocProvider<LoginCubit>(
                create: (_) => getit.get<LoginCubit>(),
              ),
              BlocProvider<OtpCubit>(
                create: (_) => getit.get<OtpCubit>(),
              ),
            ],
            child: MaterialApp.router(
              title: 'cure_team_1',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                useMaterial3: true,
              ),
              debugShowCheckedModeBanner: false,
              routerConfig: Approutes.router,
            ),
          );
        });
  }
}
