part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.loading() = LoadingState;
  const factory EditProfileState.success({
    required EditProfileResponse editProfileResponse,
  }) = SuccessState;
  const factory EditProfileState.error({required String error}) = ErrorState;
}
