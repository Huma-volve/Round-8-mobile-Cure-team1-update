import 'package:cure_team_1_update/core/constants/app_constants.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/settings/data/models/logout/logout_response.dart';

class LogoutDataSource {
  const LogoutDataSource(this._api);

  final ApiServices _api;

  Future<LogoutResponse> logout() async {
    final response = await _api.post(
      AppConstants.logoutUrl,
      <String, dynamic>{},
    );
    return LogoutResponse.fromJson(response);
  }
}
