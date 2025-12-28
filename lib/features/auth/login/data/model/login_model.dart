import 'package:cure_team_1_update/features/auth/login/data/model/user_data_login.dart';

class LoginModel {
  bool? success;
  String? message;
  UserDataLogin? data;
  String? token;

  LoginModel({this.success, this.message, this.data, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = _readToken(json);
    final dataJson = json['data'];
    if (dataJson is Map<String, dynamic>) {
      data = UserDataLogin.fromJson(dataJson);
    } else {
      final userJson = json['user'];
      if (userJson is Map<String, dynamic>) {
        data = UserDataLogin.fromJson(userJson);
      } else {
        final patientJson = json['patient'];
        data = patientJson is Map<String, dynamic>
            ? UserDataLogin.fromJson(patientJson)
            : null;
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['token'] = token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  static String? _readToken(Map<String, dynamic> json) {
    final data = json['data'];
    if (data is Map<String, dynamic>) {
      final userToken = _readTokenFromUserMap(data);
      if (userToken != null) {
        return userToken;
      }
      final nestedToken =
          data['token'] ?? data['access_token'] ?? data['accessToken'];
      if (nestedToken is String && nestedToken.isNotEmpty) {
        return nestedToken;
      }
    }
    final rootToken =
        json['token'] ?? json['access_token'] ?? json['accessToken'];
    if (rootToken is String && rootToken.isNotEmpty) {
      return rootToken;
    }
    return null;
  }

  static String? _readTokenFromUserMap(Map<String, dynamic> data) {
    final user = data['user'];
    if (user is Map<String, dynamic>) {
      final token =
          user['token'] ?? user['access_token'] ?? user['accessToken'];
      if (token is String && token.isNotEmpty) {
        return token;
      }
    }
    final patient = data['patient'];
    if (patient is Map<String, dynamic>) {
      final token =
          patient['token'] ?? patient['access_token'] ?? patient['accessToken'];
      if (token is String && token.isNotEmpty) {
        return token;
      }
    }
    return null;
  }
}
