import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/features/auth/otp/data/repo/otp_repo.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpRepo otpRepo;
  final formKey = GlobalKey<FormState>();

  final phoneNumController = TextEditingController();
  final otpNumController = TextEditingController();

  OtpCubit({required this.otpRepo}) : super(OtpInitial());

  Future<void> registUser() async {
    if (formKey.currentState?.validate() != true) return;

    emit(OtpLoading());

    final result = await otpRepo.otpUser(
      phoneNum: phoneNumController.text.trim(),
      otpNum: otpNumController.text.trim(),
    );

    result.fold(
      (failure) {
        emit(OtpError(error: failure.errormessage));
      },
      (otpModel) async {
        final token = otpModel.token;
        if (token != null && token.isNotEmpty) {
          await Cachehelper.cacheToken(token);
        }
        emit(OtpSuccess(message: otpModel.message ?? 'Unknown message'));
      },
    );
  }

  @override
  Future<void> close() {
    phoneNumController.dispose();
    otpNumController.dispose();
    return super.close();
  }
}
