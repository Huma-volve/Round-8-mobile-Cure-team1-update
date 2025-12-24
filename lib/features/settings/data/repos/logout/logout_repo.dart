import 'package:cure_team_1_update/core/services/api_result.dart';
import 'package:cure_team_1_update/features/profile/data/data_source/profile_data_source.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_request_body.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_response.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/change_password_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/delete_account/delete_account_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/logout/logout_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/models/delete_account/delete_account_response.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_request_body.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_response.dart';
import 'package:cure_team_1_update/features/settings/data/models/logout/logout_response.dart';

class LogoutRepo {
  const LogoutRepo(this._dataSource);

  final LogoutDataSource _dataSource;

  // Get User Profile
  Future<ApiResult<LogoutResponse>> logout() async {
    try {
      print('dddddddddddddddddddddddddddddddddddddd');
      final response = await _dataSource.logout();
      print('LogoutRepo: Received response: ${response.toString()}');
      return ApiResult.success(response);
    } catch (e) {
      print('LogoutRepo: Error occurred - ${e.toString()}');
      return ApiResult.failure(e.toString());
    }
  }
}
