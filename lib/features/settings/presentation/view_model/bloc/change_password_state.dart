part of 'change_password_bloc.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState.loading() = LoadingState;
  const factory ChangePasswordState.success({
    required ChangePasswordResponse changePasswordResponse,
  }) = SuccessState;
  const factory ChangePasswordState.error({required String error}) = ErrorState;
}
