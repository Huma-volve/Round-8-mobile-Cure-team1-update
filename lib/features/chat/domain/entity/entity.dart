// ignore_for_file: public_member_api_docs, sort_constructors_first
class Entity {
  final String name;
  final String lastMessage;
  final String time;
  final int? id;
  final String numberofmassage;
  final String avatar;
  final int? unreadCount;
  final bool? isfavorite;
  final bool? isarchived;
  Entity({
    required this.name,
    required this.lastMessage,
    required this.time,
    this.id,
    required this.numberofmassage,
    required this.avatar,
    this.unreadCount,
    this.isfavorite,
    this.isarchived,
  });
}
