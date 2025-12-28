class UserDataLogin {
  String? token;
  String? name;
  String? email;
  String? phone;

  UserDataLogin({this.token, this.name, this.email, this.phone});

  UserDataLogin.fromJson(Map<String, dynamic> json) {
    final user = _extractUserMap(json);
    token = json['token'] ??
        json['access_token'] ??
        json['accessToken'] ??
        user['token'] ??
        user['access_token'] ??
        user['accessToken'];
    name = user['name'] as String?;
    email = user['email'] as String?;
    phone = user['phone'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}

Map<String, dynamic> _extractUserMap(Map<String, dynamic> json) {
  final user = json['user'];
  if (user is Map<String, dynamic>) {
    return user;
  }
  final patient = json['patient'];
  if (patient is Map<String, dynamic>) {
    return patient;
  }
  final profile = json['profile'];
  if (profile is Map<String, dynamic>) {
    return profile;
  }
  return json;
}
