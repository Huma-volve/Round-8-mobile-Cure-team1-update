import 'dart:async';
import 'package:cure_team_1_update/features/settings/data/repos/change_password_repo.dart';
import 'package:cure_team_1_update/features/settings/presentation/view_model/bloc/change_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc(this._repo) : super(const ChangePasswordState.loading()) {
    on<EventChangePassword>(_changePassword);
  }

  final ChangePasswordRepo _repo;
  bool obscureCurrent = true;
  bool obscureNew = true;
  bool obscureConfirm = true;
  final formKey = GlobalKey<FormState>();

  FutureOr<void> _changePassword(
    EventChangePassword event,
    Emitter<ChangePasswordState> emit,
  ) async {
    emit(const ChangePasswordState.loading());
    print('lllllllllllllllllll ');

    final result = await _repo.changePassword(event.data);
    print('sssssssssssssssss');

    result.when(
      success: (ChangePasswordResponse) {
        print('change password successful: $ChangePasswordResponse');
        emit(ChangePasswordState.success(
            changePasswordResponse: ChangePasswordResponse));
      },
      failure: (error) {
        print('Error in ChangePasswordBloc: $error');
        emit(ChangePasswordState.error(error: error));
      },
    );
  }
}
