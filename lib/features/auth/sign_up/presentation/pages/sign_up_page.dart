import 'package:cure_team_1_update/features/auth/sign_up/presentation/pages/widgets/signup_view_body.dart';
import 'package:cure_team_1_update/core/utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/auth/sign_up/domain/signup_repo_impl.dart';
import 'package:cure_team_1_update/features/auth/sign_up/presentation/manage/signuo_cubit.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignupCubit(registerRepo: RegisterRepoImpl(getit.get<ApiServices>())),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            GoRouter.of(context).push(AppRoute.otpPage,
                extra:
                    BlocProvider.of<SignupCubit>(context).phoneController.text);
          } else if (state is SignupError) {
            AppToast.show(context, state.error);
          }
        },
        builder: (context, state) {
          return const Scaffold(
            body: SignupViewBody(),
          );
        },
      ),
    );
  }
}
