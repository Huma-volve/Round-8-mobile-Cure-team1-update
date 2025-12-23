/// Application-level constants
class AppConstants {
  /// Application name
  static const String appName = 'cure_team_1_update';

  /// API endpoints
  /// //https://round8-backend-team-one.huma-volve.com/api/profile/edit
  static const String baseUrl =
      'https://round8-backend-team-one.huma-volve.com/api/';
  static const String editProfileUrl = 'profile/edit';

  /// Storage keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  static const String themeKey = 'app_theme';

  /// Route names
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String splashRoute = '/splash';
  static const String chatRoute = '/chat';
  static const String bookScreen = '/';
}
