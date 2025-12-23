import 'package:cure_team_1_update/core/function/helperfunction.dart';
import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:flutter/material.dart';

class BubbleFreind extends StatelessWidget {
  final Historymasseges message;
  const BubbleFreind({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
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
          child: Wrap(children: [
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
          ]),
        ),
      ),
    );
  }
}
