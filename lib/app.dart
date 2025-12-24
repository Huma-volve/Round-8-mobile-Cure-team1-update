import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/auth/login/presentation/manage/login_cubit.dart';
import 'package:cure_team_1_update/features/auth/otp/presentation/manage/otp_cubit.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/cubit/chat_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_1_update/core/constants/go_route.dart';

<<<<<<< HEAD
=======
import 'features/chat/persention/view_modle/chat_cubit/chat_cubit.dart';
import 'features/settings/presentation/view_model/bloc/change_password_bloc.dart';
>>>>>>> 43e6a4d661d8da2aa9dacd0bba7a98bb4f273ab3

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
                create: (_) => getIt.get<ChatCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<EditProfileBloc>(),
              ),
              BlocProvider(
                create: (context) => getIt<ChangePasswordBloc>(),
              ),
              BlocProvider(
                create: (context) => getIt<LocationCubit>(),
              ),
            ],
            child: OverlaySupport.global(
              child: MaterialApp.router(
                  title: 'cure_team_1',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                    useMaterial3: true,
                  ),
                  debugShowCheckedModeBanner: false,
                  routerConfig: Approutes.router),
              BlocProvider<LoginCubit>(
                create: (_) => getIt.get<LoginCubit>(),
              ),
              BlocProvider<OtpCubit>(
                create: (_) => getIt.get<OtpCubit>(),
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
