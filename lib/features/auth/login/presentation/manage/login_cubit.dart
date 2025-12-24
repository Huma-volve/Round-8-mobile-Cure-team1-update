import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/features/auth/login/data/repo/login_repo.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
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
      (loginModel) async {
        print(loginModel.message);
        final token = loginModel.token ?? loginModel.data?.token;
        if (token != null && token.isNotEmpty) {
          await Cachehelper.cacheToken(token);
        }
        final userData = loginModel.data;
        final name = userData?.name;
        if (name != null && name.isNotEmpty) {
          Cachehelper.cacheUserName(name);
        }
        final email = userData?.email;
        if (email != null && email.isNotEmpty) {
          Cachehelper.cacheUserEmail(email);
        }
        final phone = userData?.phone;
        if (phone != null && phone.isNotEmpty) {
          Cachehelper.cacheUserPhone(phone);
        }
        emit(LoginSuccess(message: loginModel.message ?? ''));
      },
    );
  }
}
