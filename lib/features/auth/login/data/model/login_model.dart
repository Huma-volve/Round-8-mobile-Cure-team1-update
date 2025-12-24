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
    data = dataJson is Map<String, dynamic>
        ? UserDataLogin.fromJson(dataJson)
        : null;
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
}
