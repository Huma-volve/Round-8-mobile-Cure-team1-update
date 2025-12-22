import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/features/auth/login/data/repo/login_repo.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  final formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  Future<void> logUser() async {
    if (!formKey.currentState!.validate()) return;
    print("Sending phone number: ${phoneController.text.trim()}");
    emit(LoginLoading());

    var result = await loginRepo.loginUSer(
      phoneNumber: phoneController.text.trim(),
      password: passwordController.text.trim(),
    );

    result.fold(
      (failure) {
        emit(LoginError(error: failure.errormessage));
      },
      (loginModel) {
        print(loginModel.message);
        // You can access loginModel.data?.token here if you need to store the token.
        emit(LoginSuccess(message: loginModel.message ?? ''));
      },
    );
  }
}
