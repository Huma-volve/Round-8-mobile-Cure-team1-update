import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_profile_request_body.freezed.dart';
part 'edit_profile_request_body.g.dart';

@freezed
class EditProfileRequestBody with _$EditProfileRequestBody {
  const factory EditProfileRequestBody({
    required String name,
    required String email,
    required String birthdate,
    required String phone,
  }) = _EditProfileRequestBody;

  factory EditProfileRequestBody.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestBodyFromJson(json);
}
