import 'package:cure_team_1_update/core/constants/app_constants.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_request_body.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_response.dart';

class ChangePasswordDataSource {
  const ChangePasswordDataSource(this._api);

  final ApiServices _api;

  Future<ChangePasswordResponse> changePassword(
    ChangePasswordRequestBody data,
  ) async {
    final response = await _api.put(
      AppConstants.changePasswordUrl,
      data.toJson(),
    );
    return ChangePasswordResponse.fromJson(response);
  }
}
