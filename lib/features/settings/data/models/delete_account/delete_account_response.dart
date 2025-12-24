import 'package:freezed_annotation/freezed_annotation.dart';
part 'delete_account_response.freezed.dart';
part 'delete_account_response.g.dart';

// {
//     "success": true,
//     "message": "Your account is deleted successfully"
// }
@freezed
class DeleteAccountResponse with _$DeleteAccountResponse {
  const factory DeleteAccountResponse({
    required bool success,
    required String message,
  }) = _DeleteAccountResponse;
  factory DeleteAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountResponseFromJson(json);
}
