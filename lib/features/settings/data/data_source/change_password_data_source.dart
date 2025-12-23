import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_request_body.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_response.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_request_body.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_response.dart';

class ChangePasswordDataSource {
  const ChangePasswordDataSource(this._api);

  final ApiServices _api;

  Future<ChangePasswordResponse> changePassword(
    ChangePasswordRequestBody data,
  ) async {
    print('rrrrrr');
    try {
      print('before');
      final response = await _api.put(
        'https://round8-backend-team-one.huma-volve.com/api/profile/change-password',
        {
          "current_password": "12345678Aa@",
          "new_password": "12345678aA@",
          "new_password_confirmation": "12345678aA@"
        },
        // data.toJson(),
        '86|DRpQSFEkDdBRnUvu07X4NL9EkpltLRonwzhofApD6a519424',
      );
      print(
          'EditProfileDataSource: Sending edit profile request with data: ${response.toString()}');

      return response;
    } catch (e) {
      print(e);
    }
    throw Exception('Failed to edit profile');
  }
}
