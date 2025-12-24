part of 'logout_bloc.dart';

@freezed
class LogoutState with _$LogoutState {
  const factory LogoutState.loading() = LoadingState;
  const factory LogoutState.success({
    required LogoutResponse logoutResponse,
  }) = SuccessState;
  const factory LogoutState.error({required String error}) = ErrorState;
}
