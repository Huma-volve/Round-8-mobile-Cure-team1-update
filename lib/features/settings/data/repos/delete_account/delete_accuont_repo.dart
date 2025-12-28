import 'package:cure_team_1_update/core/services/api_result.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/delete_account/delete_account_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/models/delete_account/delete_account_response.dart';
import 'package:dio/dio.dart';

class DeleteAccuontRepo {
  const DeleteAccuontRepo(this._dataSource);

  final DeleteAccounteDataSource _dataSource;

  // Get User Profile
  Future<ApiResult<DeleteAccountResponse>> deleteAccuont() async {
    try {
      final response = await _dataSource.deleteAccounte();
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
      final errors = data['errors'];
      if (errors is Map<String, dynamic> && errors.isNotEmpty) {
        final firstEntry = errors.values.first;
        if (firstEntry is List && firstEntry.isNotEmpty) {
          final firstMessage = firstEntry.first;
          if (firstMessage is String && firstMessage.isNotEmpty) {
            return firstMessage;
          }
        }
        if (firstEntry is String && firstEntry.isNotEmpty) {
          return firstEntry;
        }
      }
    }
    return error.message ?? 'Delete account failed.';
  }
}
