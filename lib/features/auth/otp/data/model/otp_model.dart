class OtpModel {
  bool? success;
  String? message;
  String? token;

  OtpModel({this.success, this.message, this.token});

  OtpModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    token = _readToken(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['token'] = token;
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
