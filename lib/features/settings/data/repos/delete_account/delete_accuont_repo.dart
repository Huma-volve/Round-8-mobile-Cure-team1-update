import 'package:cure_team_1_update/core/services/api_result.dart';
import 'package:cure_team_1_update/features/profile/data/data_source/profile_data_source.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_request_body.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_response.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/change_password_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/delete_account/delete_account_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/models/delete_account/delete_account_response.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_request_body.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_response.dart';

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
