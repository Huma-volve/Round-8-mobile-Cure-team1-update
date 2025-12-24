import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/Home/location/presentation/cubit/location_cubit.dart';
import 'package:cure_team_1_update/features/profile/presentation/bloc/bloc/edit_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_1_update/core/constants/go_route.dart';
import 'package:overlay_support/overlay_support.dart';

import 'features/chat/persention/view_modle/chat_cubit/chat_cubit.dart';
import 'features/settings/presentation/view_model/bloc/change_password_bloc.dart';

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
            ),
          );
        });
  }
}
