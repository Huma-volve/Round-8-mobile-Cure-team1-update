import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/auth/login/domain/login_repo_impl.dart';
import 'package:cure_team_1_update/features/auth/login/presentation/manage/login_cubit.dart';
import 'package:cure_team_1_update/features/auth/login/presentation/pages/widgets/login_view_body.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginCubit(loginRepo: LoginRepoImpl(ApiServices(Dio()))),
      child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state is LoginSuccess) {
          GoRouter.of(context).push(AppRoute.home);
        } else if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      }, builder: (context, state) {
        return Scaffold(
          body: LoginViewBody(),
        );
      }),
    );
  }
}
