part of 'delete_account_bloc.dart';

@freezed
class DeleteAccountEvent with _$DeleteAccountEvent {
  const factory DeleteAccountEvent.started() = _Started;
  const factory DeleteAccountEvent.deleteAccount() = EventDeleteAccount;
}
