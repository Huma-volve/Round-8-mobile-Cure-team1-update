import 'package:cure_team_1_update/core/function/helperfunction.dart';
import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:flutter/material.dart';

class Textmessage extends StatelessWidget {
  const Textmessage({super.key, required this.message});
  final Historymasseges message;
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Text(
        message.body!,
        textAlign: TextAlign.start,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      Text(
        textAlign: TextAlign.start,
        formatTimeToHourMinute(message.createdAt!),
        style: const TextStyle(color: Colors.white),
      )
    ]);
  }
}
