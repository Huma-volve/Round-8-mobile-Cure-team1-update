class OtherUser {
  int? id;
  String? name;
  String? avatar;

  OtherUser({this.id, this.name, this.avatar});

  factory OtherUser.fromJson(Map<String, dynamic> json) => OtherUser(
        id: json['id'] as int?,
        name: json['name'] as String?,
        avatar: json['avatar'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatar': avatar,
      };
}
