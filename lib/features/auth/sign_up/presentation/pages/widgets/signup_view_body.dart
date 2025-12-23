import 'package:cure_team_1_update/core/common/widgets/button_with_google.dart';
import 'package:cure_team_1_update/core/common/widgets/custome_button.dart';
import 'package:cure_team_1_update/core/common/widgets/custome_text_field.dart';
import 'package:cure_team_1_update/core/common/widgets/phone_input.dart';
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/auth/login/presentation/pages/widgets/divider_login.dart';
import 'package:cure_team_1_update/features/auth/sign_up/presentation/pages/widgets/remember_me.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:cure_team_1_update/features/auth/sign_up/presentation/manage/signuo_cubit.dart';

// ignore: must_be_immutable
class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SignupCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: cubit.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Image.asset(
                  Assets.resourceImagesIconSplash,
                  color: ColorsLight.primaryColor,
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                'Create New Account',
                style: AppTextStyles.stylegeorgia32(context),
              ),
              SizedBox(
                height: 60.h,
              ),
              CustomeTextField(
                text: 'FullName',
                perfixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 26,
                ),
                controller: cubit.nameController,
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomeTextField(
                text: 'Email',
                perfixIcon: const Icon(
                  Icons.email,
                  color: Colors.grey,
                  size: 26,
                ),
                controller: cubit.emailController,
              ),
              SizedBox(
                height: 24.h,
              ),
              PhoneInputExample(controller: cubit.phoneController),
              SizedBox(
                height: 24.h,
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
                height: 24.h,
              ),
              CustomeTextField(
                text: 'Confirm Password',
                isPassword: true,
                perfixIcon: const Icon(
                  Icons.password,
                  color: Colors.grey,
                  size: 26,
                ),
                controller: cubit.passwordConfirmController,
              ),
              const RememberMe(),
              SizedBox(
                height: 72.h,
              ),
              CustomeButton(
                  text: 'Sign up',
                  color: ColorsLight.primaryColor,
                  onTap: () {
                    cubit.registUser();
                  }),
              SizedBox(
                height: 24.h,
              ),
              const DividerLogin(),
              SizedBox(
                height: 24.h,
              ),
              ButtonWithGoogle(onTap: () {
                context.go(AppRoute.navBar);
              }),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account!  ',
                    style: AppTextStyles.styleSmall16(context),
                  ),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pushReplacement(AppRoute.loginPage);
                    },
                    child: Text(
                      'Sign in',
                      style: AppTextStyles.styleSmall16(context)
                          .copyWith(color: ColorsLight.primaryColor),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
