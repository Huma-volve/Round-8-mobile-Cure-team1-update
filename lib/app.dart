import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/Home/Doctor/Presentation/cubit/doctor_cubit.dart';
import 'package:cure_team_1_update/features/chat/domain/repo/chatrepo.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cure_team_1_update/core/constants/go_route.dart';

import 'features/Home/Doctor/Presentation/cubit/specailty_cubit.dart';
import 'features/Home/location/presentation/cubit/location_cubit.dart';

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
              BlocProvider<LocationCubit>(
                create: (_) => getIt<LocationCubit>(),
              ),
              BlocProvider<DoctorCubit>(
                create: (_) => getIt<DoctorCubit>(),
              ),
              //BlocProvider<DoctorsBySpecialtyCubit>(
              //  create: (_) => getIt<DoctorsBySpecialtyCubit>(),
            //  ),
              BlocProvider<ChatCubit>(
                create: (_) => getIt<ChatCubit>(),
              ),
            ],
            child: MaterialApp.router(
                title: 'cure_team_1',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  useMaterial3: true,
                ),
                debugShowCheckedModeBanner: false,
                routerConfig: Approutes.router),
          );
        });
  }
}
