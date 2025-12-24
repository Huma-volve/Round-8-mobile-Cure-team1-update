import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/settings/data/models/logout/logout_response.dart';

class LogoutDataSource {
  const LogoutDataSource(this._api);

  final ApiServices _api;

  Future<LogoutResponse> logout() async {
    try {
      print('before');
      final response = await _api.postForLogout('profile/logout');
      print(
          'LogoutDataSource: Sending logout request with data: ${response.toString()}');

      return LogoutResponse.fromJson(response);
    } catch (e) {
      print(e);
    }
    throw Exception('Failed to edit profile');
  }
}
