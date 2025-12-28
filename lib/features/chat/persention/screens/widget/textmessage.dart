import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:flutter/material.dart';

class Textmessage extends StatelessWidget {
  const Textmessage({
    super.key,
    required this.message,
    required this.isOutgoing,
  });

  final Historymasseges message;
  final bool isOutgoing;

  @override
  Widget build(BuildContext context) {
    return Text(
      message.body ?? '',
      textAlign: TextAlign.start,
      style: TextStyle(
        color: isOutgoing ? Colors.white : const Color(0xFF1F2937),
        fontSize: 14,
        height: 1.3,
      ),
    );
  }
}
