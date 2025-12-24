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
    final response = await _api.put(
      AppConstants.editProfileUrl,
      data.toJson(),
    );
    if (response is! Map<String, dynamic>) {
      throw Exception('Invalid response from server.');
    }
    final normalized = _normalizeResponse(response, data);
    return EditProfileResponse.fromJson(normalized);
  }

  Map<String, dynamic> _normalizeResponse(
    Map<String, dynamic> response,
    EditProfileRequestBody request,
  ) {
    final rawData = response['data'];
    final data = rawData is Map<String, dynamic>
        ? rawData
        : <String, dynamic>{};
    final birthdate = _readBirthdate(
      data['birthdate'],
      fallback: request.birthdate,
    );

    return <String, dynamic>{
      'success': response['success'] is bool ? response['success'] : true,
      'message': response['message'] is String
          ? response['message']
          : 'Profile updated successfully',
      'data': <String, dynamic>{
        'name': data['name'] is String ? data['name'] : request.name,
        'email': data['email'] is String ? data['email'] : request.email,
        'phone': data['phone'] is String ? data['phone'] : request.phone,
        'birthdate': birthdate,
      },
    };
  }

  String _readBirthdate(dynamic value, {required String fallback}) {
    if (value is String && value.isNotEmpty) {
      return value;
    }
    if (value is Map<String, dynamic>) {
      final day = value['Day'] ?? value['day'];
      final month = value['Month'] ?? value['month'];
      final year = value['Year'] ?? value['year'];
      if (day != null && month != null && year != null) {
        return '$day/$month/$year';
      }
    }
    return fallback;
  }
}
