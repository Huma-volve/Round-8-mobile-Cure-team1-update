import 'package:cure_team_1_update/core/services/api_result.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/logout/logout_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/models/logout/logout_response.dart';
import 'package:dio/dio.dart';

class LogoutRepo {
  const LogoutRepo(this._dataSource);

  final LogoutDataSource _dataSource;

  // Get User Profile
  Future<ApiResult<LogoutResponse>> logout() async {
    try {
      final response = await _dataSource.logout();
      return ApiResult.success(response);
    } on DioException catch (error) {
      return ApiResult.failure(_extractDioMessage(error));
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }

  String _extractDioMessage(DioException error) {
    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      final message = data['message'];
      if (message is String && message.isNotEmpty) {
        return message;
      }
    }
    return error.message ?? 'Logout failed.';
  }
}
