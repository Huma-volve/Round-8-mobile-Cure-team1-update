import 'package:cure_team_1_update/core/constants/app_constants.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_request_body.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_response.dart';

class EditProfileDataSource {
  const EditProfileDataSource(this._api);

  final ApiServices _api;

  Future<EditProfileResponse> editProfile(
    EditProfileRequestBody data,
  ) async {
    print('rrrrrr');
    try {
      print('before');
      final response = await _api.put(
        '${AppConstants.editProfileUrl}',
        {
          "name": "mankljjkhkjhar",
          "email": "manaralkjhlkli@gmail.com",
          "phone": "+201125345129",
          "birthdate": "01-01-2002"
        },
        // data.toJson(),
        '126|DvafudnkSIrLEmqMQmjKaZeeEbw2ta3bheNYuk4K7ddecb6d',
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
