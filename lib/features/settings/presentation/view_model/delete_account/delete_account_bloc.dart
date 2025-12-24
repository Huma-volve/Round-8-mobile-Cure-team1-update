import 'dart:async';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_request_body.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_response.dart';
import 'package:cure_team_1_update/features/profile/data/repos/edit_profile_repo.dart';
import 'package:cure_team_1_update/features/settings/data/models/delete_account/delete_account_response.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_request_body.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_response.dart';
import 'package:cure_team_1_update/features/settings/data/repos/change_password_repo.dart';
import 'package:cure_team_1_update/features/settings/data/repos/delete_account/delete_accuont_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_account_event.dart';
part 'delete_account_state.dart';
part 'delete_account_bloc.freezed.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  DeleteAccountBloc(this._repo) : super(const DeleteAccountState.loading()) {
    on<EventDeleteAccount>(_deletAccount);
  }

  final DeleteAccuontRepo _repo;

  FutureOr<void> _deletAccount(
    EventDeleteAccount event,
    Emitter<DeleteAccountState> emit,
  ) async {
    emit(const DeleteAccountState.loading());
    print('lllllllllllllllllll ');

    final result = await _repo.deleteAccuont();
    print('sssssssssssssssss');

    result.when(
      success: (deleteAccountResponse) {
        print('delete account successful: $deleteAccountResponse');
        emit(DeleteAccountState.success(
            deleteAccountResponse: deleteAccountResponse));
      },
      failure: (error) {
        print('Error in DeleteAccountBloc: $error');
        emit(DeleteAccountState.error(error: error));
      },
    );
  }
}
