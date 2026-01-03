
import 'dart:async';
import 'package:cure_team_1_update/features/settings/data/models/logout/logout_response.dart';
import 'package:cure_team_1_update/features/settings/data/repos/logout/logout_repo.dart';
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
    hasRequested = true;
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
