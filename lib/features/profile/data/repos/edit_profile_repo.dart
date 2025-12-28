import 'package:cure_team_1_update/core/services/api_result.dart';
import 'package:cure_team_1_update/features/profile/data/data_source/profile_data_source.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_request_body.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_response.dart';
import 'package:dio/dio.dart';

class EditProfileRepo {
  const EditProfileRepo(this._dataSource);

  final EditProfileDataSource _dataSource;

  // Get User Profile
  Future<ApiResult<EditProfileResponse>> editProfile(
    EditProfileRequestBody data,
  ) async {
    try {
      final response = await _dataSource.editProfile(data);
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
    return error.message ?? 'Edit profile failed.';
  }
}
