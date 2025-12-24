part of 'delete_account_bloc.dart';

@freezed
class DeleteAccountState with _$DeleteAccountState {
  const factory DeleteAccountState.loading() = LoadingState;
  const factory DeleteAccountState.success({
    required DeleteAccountResponse deleteAccountResponse,
  }) = SuccessState;
  const factory DeleteAccountState.error({required String error}) = ErrorState;
}
