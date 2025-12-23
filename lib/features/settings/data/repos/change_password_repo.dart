import 'package:cure_team_1_update/core/services/api_result.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/change_password_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_request_body.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_response.dart';

class ChangePasswordRepo {
  const ChangePasswordRepo(this._dataSource);

  final ChangePasswordDataSource _dataSource;

  // Get User Profile
  Future<ApiResult<ChangePasswordResponse>> changePassword(
    ChangePasswordRequestBody data,
  ) async {
    try {
      print('dddddddddddddddddddddddddddddddddddddd');
      final response = await _dataSource.changePassword(data);
      print('ChangePasswordRepo: Received response: ${response.toString()}');
      return ApiResult.success(response);
    } catch (e) {
      print('ChangePasswordRepo: Error occurred - ${e.toString()}');
      return ApiResult.failure(e.toString());
    }
  }
}
