import 'package:cure_team_1_update/core/function/helperfunction.dart';
import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/imagemessage.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/textmessage.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/videomessage.dart';
import 'package:flutter/material.dart';

class BubbleFreind extends StatelessWidget {
  final Historymasseges message;
  const BubbleFreind({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final body = message.body ?? '';
    final timeText = _safeTime(message.createdAt);
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
        ),
        decoration: const BoxDecoration(
            color: Color(0xff145DB8),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(28),
                bottomLeft: Radius.circular(28))),
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: message.type == 'text'
                ? Textmessage(
                    message: message,
                  )
                : message.type == 'video'
                    ? BubbleVideo(
                        message: message,
                      )
                    : ImageMessageWidget(message: message)),
      ),
    );
  }
}

String _safeTime(String? value) {
  if (value == null || value.isEmpty) {
    return '';
  }
  final parsed = DateTime.tryParse(value);
  if (parsed == null) {
    return '';
  }
  return formatTimeToHourMinute(value);
}
