import 'package:cure_team_1_update/core/services/api_result.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/delete_account/delete_account_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/models/delete_account/delete_account_response.dart';


class DeleteAccuontRepo {
  const DeleteAccuontRepo(this._dataSource);

  final DeleteAccounteDataSource _dataSource;

  // Get User Profile
  Future<ApiResult<DeleteAccountResponse>> deleteAccuont() async {
    try {
      print('dddddddddddddddddddddddddddddddddddddd');
      final response = await _dataSource.deleteAccounte();
      print('DeleteAccuontRepo: Received response: ${response.toString()}');
      return ApiResult.success(response);
    } catch (e) {
      print('DeleteAccuontRepo: Error occurred - ${e.toString()}');
      return ApiResult.failure(e.toString());
    }
  }
}
