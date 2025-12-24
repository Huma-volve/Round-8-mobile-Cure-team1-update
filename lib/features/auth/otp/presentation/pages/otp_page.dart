import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/auth/otp/presentation/manage/otp_cubit.dart';
import 'package:cure_team_1_update/features/auth/otp/presentation/pages/widgets/otp_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OtpPage extends StatelessWidget {
  final String phoneNum;
  const OtpPage({super.key, required this.phoneNum});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OtpCubit>(),
      child: BlocConsumer<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state is OtpSuccess) {
            GoRouter.of(context).pushReplacement(AppRoute.home);
          } else if (state is OtpError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: OtpViewBody(phoneNum: phoneNum),
          );
        },
      ),
    );
  }
}
