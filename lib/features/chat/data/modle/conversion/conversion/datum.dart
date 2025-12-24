import 'other_user.dart';

class Datum {
  int? id;
  bool? isPrivate;
  OtherUser? otherUser;
  dynamic lastMessage;
  int? unreadCount;
  bool? isFavorite;
  bool? isArchived;
  String? updatedAt;

  Datum({
    this.id,
    this.isPrivate,
    this.otherUser,
    this.lastMessage,
    this.unreadCount,
    this.isFavorite,
    this.isArchived,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        isPrivate: json['is_private'] as bool?,
        otherUser: json['other_user'] == null
            ? null
            : OtherUser.fromJson(json['other_user'] as Map<String, dynamic>),
        lastMessage: json['last_message'] as dynamic,
        unreadCount: json['unread_count'] as int?,
        isFavorite: json['is_favorite'] as bool?,
        isArchived: json['is_archived'] as bool?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'is_private': isPrivate,
        'other_user': otherUser?.toJson(),
        'last_message': lastMessage,
        'unread_count': unreadCount,
        'is_favorite': isFavorite,
        'is_archived': isArchived,
        'updated_at': updatedAt,
      };
}
