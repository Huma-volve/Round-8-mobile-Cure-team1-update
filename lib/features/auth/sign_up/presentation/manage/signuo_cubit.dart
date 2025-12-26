import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/features/auth/sign_up/data/repo/signup_repo.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo registerRepo;
  final formKey = GlobalKey<FormState>();

  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  SignupCubit({required this.registerRepo}) : super(SignupInitial());

  Future<void> registUser() async {
    if (formKey.currentState?.validate() != true) return;

    emit(SignupLoading());

    final result = await registerRepo.signupUser(
      fullName: nameController.text.trim(),
      phoneNumber: phoneController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      passwordConfirm: passwordConfirmController.text.trim(),
    );

    result.fold(
      (failure) {
        emit(SignupError(error: failure.errormessage));
      },
      (signupModel) async {
        final token = signupModel.token;
        if (token != null && token.isNotEmpty) {
          await Cachehelper.cacheToken(token);
        }
        final cachedName = nameController.text.trim();
        if (cachedName.isNotEmpty) {
          await Cachehelper.cacheUserName(cachedName);
        }
        final cachedEmail = emailController.text.trim();
        if (cachedEmail.isNotEmpty) {
          await Cachehelper.cacheUserEmail(cachedEmail);
        }
        final cachedPhone = phoneController.text.trim();
        if (cachedPhone.isNotEmpty) {
          await Cachehelper.cacheUserPhone(cachedPhone);
        }
        emit(SignupSuccess(message: signupModel.message ?? 'Unknown message'));
      },
    );
  }

  @override
  Future<void> close() {
    phoneController.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    return super.close();
  }
}
