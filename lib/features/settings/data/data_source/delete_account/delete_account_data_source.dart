import 'package:cure_team_1_update/core/constants/app_constants.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/settings/data/models/delete_account/delete_account_response.dart';

class DeleteAccounteDataSource {
  const DeleteAccounteDataSource(this._api);

  final ApiServices _api;

  Future<DeleteAccountResponse> deleteAccounte() async {
    final response = await _api.delete(AppConstants.deleteAccountUrl);
    return DeleteAccountResponse.fromJson(response);
  }
}
