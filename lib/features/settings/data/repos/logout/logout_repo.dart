import 'package:cure_team_1_update/core/services/api_result.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/logout/logout_data_source.dart';
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
