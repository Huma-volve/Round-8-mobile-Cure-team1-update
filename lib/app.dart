import 'package:cure_team_1_update/core/services/service_locator.dart';

import 'package:cure_team_1_update/features/profile/presentation/bloc/bloc/edit_profile_bloc.dart';
import 'package:cure_team_1_update/features/profile/presentation/screens/profile_screen.dart';
import 'package:cure_team_1_update/features/settings/presentation/view_model/bloc/change_password_bloc.dart';
import 'package:cure_team_1_update/features/settings/presentation/view_model/delete_account/delete_account_bloc.dart';
import 'package:cure_team_1_update/features/settings/presentation/view_model/logout/logout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return MultiBlocProvider(
            providers: [
              BlocProvider<ChatCubit>(
                create: (_) => getit.get<ChatCubit>(),
              ),
              BlocProvider(
                create: (context) => getit<EditProfileBloc>(),
              ),
              BlocProvider(
                create: (context) => getit<ChangePasswordBloc>(),
              ),
              BlocProvider(
                create: (context) => getit<DeleteAccountBloc>(),
              ),
              BlocProvider(
                create: (context) => getit<ChangePasswordBloc>(),
              ),
              BlocProvider(
                create: (context) => getit<LogoutBloc>(),
              ),
            ],
            child: OverlaySupport.global(
              child: MaterialApp.router(
                  // child: MaterialApp(
                  title: 'cure_team_1',
                  theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    primarySwatch: Colors.blue,
                    useMaterial3: true,
                  ),
                  debugShowCheckedModeBanner: false,
                  // home: ProfileScreen(),
                  routerConfig: Approutes.router),
            ),
          );
        });
  }
}
