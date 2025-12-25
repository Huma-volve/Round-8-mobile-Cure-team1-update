import 'dart:async';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_request_body.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_response.dart';
import 'package:cure_team_1_update/features/profile/data/repos/edit_profile_repo.dart';
import 'package:cure_team_1_update/features/settings/data/models/delete_account/delete_account_response.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_request_body.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_response.dart';
import 'package:cure_team_1_update/features/settings/data/models/logout/logout_response.dart';
import 'package:cure_team_1_update/features/settings/data/repos/change_password_repo.dart';
import 'package:cure_team_1_update/features/settings/data/repos/delete_account/delete_accuont_repo.dart';
import 'package:cure_team_1_update/features/settings/data/repos/logout/logout_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc(this._repo) : super(const LogoutState.loading()) {
    on<EventLogout>(_logout);
  }

  final LogoutRepo _repo;
//يارب  يامسهل
  FutureOr<void> _logout(
    EventLogout event,
    Emitter<LogoutState> emit,
  ) async {
    emit(const LogoutState.loading());

    final result = await _repo.logout();

    result.when(
      success: (logoutResponse) {
        emit(LogoutState.success(logoutResponse: logoutResponse));
      },
      failure: (error) {
        emit(LogoutState.error(error: error));
      },
    );
  }
}
