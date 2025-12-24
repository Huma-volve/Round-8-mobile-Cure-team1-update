import 'package:freezed_annotation/freezed_annotation.dart';
part 'logout_response.freezed.dart';
part 'logout_response.g.dart';

// {
//     "success": true,
//     "message": "Your account is deleted successfully"
// }
@freezed
class LogoutResponse with _$LogoutResponse {
  const factory LogoutResponse({
    required bool success,
    required String message,
  }) = _LogoutResponse;
  factory LogoutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseFromJson(json);
}
