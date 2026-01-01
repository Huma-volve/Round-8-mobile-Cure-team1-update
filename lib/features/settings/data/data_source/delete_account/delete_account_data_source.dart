import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/settings/data/models/delete_account/delete_account_response.dart';

class DeleteAccounteDataSource {
  const DeleteAccounteDataSource(this._api);

  final ApiServices _api;

  Future<DeleteAccountResponse> deleteAccounte() async {
    try {
      print('before');
      final response = await _api.delete('profile/delete');
      print(
          'DeleteAccounteDataSource: Sending change password request with data: ${response.toString()}');

      return DeleteAccountResponse.fromJson(response);
    } catch (e) {
      print(e);
    }
    throw Exception('Failed to edit profile');
  }
}
