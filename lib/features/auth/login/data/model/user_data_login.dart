class UserDataLogin {
  String? token;
  String? name;
  String? email;
  String? phone;

  UserDataLogin({this.token, this.name, this.email, this.phone});

  UserDataLogin.fromJson(Map<String, dynamic> json) {
    token = json['token'] ?? json['access_token'] ?? json['accessToken'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
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
