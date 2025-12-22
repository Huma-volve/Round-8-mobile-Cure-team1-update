import 'package:cure_team_1_update/core/common/widgets/button_with_google.dart';
import 'package:cure_team_1_update/core/common/widgets/custome_button.dart';
import 'package:cure_team_1_update/core/common/widgets/custome_text_field.dart';
import 'package:cure_team_1_update/core/common/widgets/phone_input.dart';
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/auth/login/presentation/manage/login_cubit.dart';
import 'package:cure_team_1_update/features/auth/login/presentation/pages/widgets/divider_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: cubit.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset(Assets.resourceImagesLogin)),
            SizedBox(
              height: 32.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Enter your phone number',
                  style: AppTextStyles.styleLarge24(context),
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            PhoneInputExample(
              controller: cubit.phoneController,
            ),
            const SizedBox(
              height: 12,
            ),
            CustomeTextField(
              text: 'Password',
              isPassword: true,
              perfixIcon: const Icon(
                Icons.password_outlined,
                color: Colors.grey,
                size: 26,
              ),
              controller: cubit.passwordController,
            ),
            SizedBox(
              height: 32.h,
            ),
            CustomeButton(
                text: 'Sign in with your Phone Number',
                color: ColorsLight.primaryColor,
                onTap: () {
                  cubit.logUser();
                }),
            SizedBox(
              height: 16.h,
            ),
            const DividerLogin(),
            SizedBox(
              height: 16.h,
            ),
            ButtonWithGoogle(
              onTap: () {
                context.go(AppRoute.navBar);
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account?   ',
                  style: AppTextStyles.styleLarge16(context),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pushReplacement(AppRoute.signupPage);
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(color: ColorsLight.primaryColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
