import 'package:cure_team_1_update/core/common/widgets/button_with_google.dart';
import 'package:cure_team_1_update/core/common/widgets/custome_button.dart';
import 'package:cure_team_1_update/core/common/widgets/custome_text_field.dart';
import 'package:cure_team_1_update/core/common/widgets/phone_input.dart';
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/app_toast.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:cure_team_1_update/features/auth/google_services/google_auth_service.dart';
import 'package:cure_team_1_update/features/auth/login/presentation/manage/login_cubit.dart';
import 'package:cure_team_1_update/features/auth/login/presentation/pages/widgets/divider_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  String _googleErrorMessage(Object error) {
    if (error is FirebaseAuthException) {
      return error.message ?? error.code;
    }
    if (error is PlatformException) {
      return error.message ?? error.code;
    }
    return error.toString();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: cubit.formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
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
                onTap: () async {
                  try {
                    final userCredential =
                        await GoogleAuthService().signInWithGoogle();

                    if (userCredential.user == null) {
                      AppToast.show(context, 'Google sign-in failed.');
                      return;
                    }
                    final user = userCredential.user!;
                    final idToken = await user.getIdToken();
                    if (idToken!.isNotEmpty) {
                      await Cachehelper.cacheToken(idToken);
                    }
                    final displayName = user.displayName?.trim();
                    if (displayName != null && displayName.isNotEmpty) {
                      await Cachehelper.cacheUserName(displayName);
                    } else {
                      final emailName = user.email?.split('@').first.trim();
                      if (emailName != null && emailName.isNotEmpty) {
                        await Cachehelper.cacheUserName(emailName);
                      }
                    }
                    final email = user.email?.trim();
                    if (email != null && email.isNotEmpty) {
                      await Cachehelper.cacheUserEmail(email);
                    }
                    final phone = user.phoneNumber?.trim();
                    if (phone != null && phone.isNotEmpty) {
                      await Cachehelper.cacheUserPhone(phone);
                    }
                    GoRouter.of(context).go(AppRoute.home);
                  } catch (e) {
                    final message = _googleErrorMessage(e);
                    debugPrint('Google Sign-In error: $message');
                    AppToast.show(context, message);
                  }
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?   ",
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
      ),
    );
  }
}
