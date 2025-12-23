import 'package:freezed_annotation/freezed_annotation.dart';
part 'change_password_request_body.freezed.dart';
part 'change_password_request_body.g.dart';

@freezed
class ChangePasswordRequestBody with _$ChangePasswordRequestBody {
  const factory ChangePasswordRequestBody({
    required String current_password,
    required String new_password,
    required String new_password_confirmation,
  }) = _ChangePasswordRequestBody;

  factory ChangePasswordRequestBody.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestBodyFromJson(json);
}
