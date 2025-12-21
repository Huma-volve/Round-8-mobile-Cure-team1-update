import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/features/auth/sign_up/data/repo/signup_repo.dart';
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
    if (!formKey.currentState!.validate()) return;

    emit(SignupLoading());

    var result = await registerRepo.signupUser(
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
      (signupModel) {
        print(signupModel.message);
        emit(SignupSuccess(message: signupModel.message ?? 'Unknown message'));
      },
    );
  }
}
