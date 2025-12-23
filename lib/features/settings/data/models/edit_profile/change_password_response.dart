import 'package:freezed_annotation/freezed_annotation.dart';
part 'change_password_response.freezed.dart';
part 'change_password_response.g.dart';

// {
//     "success": true,
//     "message": "Your password is changed successfully"
// }
@freezed
class ChangePasswordResponse with _$ChangePasswordResponse {
  const factory ChangePasswordResponse({
    required bool success,
    required String message,
  }) = _ChangePasswordResponse;

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);
}
