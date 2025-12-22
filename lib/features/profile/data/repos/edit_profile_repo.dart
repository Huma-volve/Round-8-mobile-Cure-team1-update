import 'package:cure_team_1_update/core/services/api_result.dart';
import 'package:cure_team_1_update/features/profile/data/data_source/profile_data_source.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_request_body.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_response.dart';

class EditProfileRepo {
  const EditProfileRepo(this._dataSource);

  final EditProfileDataSource _dataSource;

  // Get User Profile
  Future<ApiResult<EditProfileResponse>> editProfile(
    EditProfileRequestBody data,
  ) async {
    try {
      print('dddddddddddddddddddddddddddddddddddddd');
      final response = await _dataSource.editProfile(data);
      print('EditProfileRepo: Received response: ${response.toString()}');
      return ApiResult.success(response);
    } catch (e) {
      print('EditProfileRepo: Error occurred - ${e.toString()}');
      return ApiResult.failure(e.toString());
    }
  }
}
