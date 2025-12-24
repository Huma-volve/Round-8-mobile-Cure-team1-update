import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/bubble_freind.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/bubble_text.dart';
import 'package:flutter/material.dart';

class Chatmassges extends StatelessWidget {
  const Chatmassges({
    super.key,
    required this.list,
    required this.scroll,
    required this.otherUserId,
  });
  final List<Historymasseges> list;
  final ScrollController? scroll;
  final int? otherUserId;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scroll,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final message = list[index];
          final senderId = message.senderId;
          final isCurrentUser = _isCurrentUser(senderId, otherUserId, message);

          return isCurrentUser
              ? BubbleFreind(message: message)
              : BubbleText(conversion: message);
        });
  }

  bool _isCurrentUser(
    int? senderId,
    int? otherUserId,
    Historymasseges message,
  ) {
    if (senderId != null && otherUserId != null) {
      return senderId != otherUserId;
    }

    final senderName = message.senderName ?? '';
    return senderName.trim().toLowerCase() == 'demo patient';
  }
}
