import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_profile_response.freezed.dart';
part 'edit_profile_response.g.dart';

@freezed
class EditProfileResponse with _$EditProfileResponse {
  const factory EditProfileResponse({
    required bool success,
    required String message,
    required EditProfileData data,
  }) = _EditProfileResponse;

  factory EditProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseFromJson(json);
}

@freezed
class EditProfileData with _$EditProfileData {
  const factory EditProfileData({
    required String name,
    required String email,
    required String phone,
    required String birthdate,
  }) = _EditProfileData;

  factory EditProfileData.fromJson(Map<String, dynamic> json) =>
      _$EditProfileDataFromJson(json);
}
