import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/bubble_freind.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/bubble_text.dart';
import 'package:flutter/material.dart';

class Chatmassges extends StatelessWidget {
  const Chatmassges({super.key, required this.list, required this.scroll});
  final List<Historymasseges> list;
  final ScrollController? scroll;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scroll,
        itemCount: list.length,
        itemBuilder: (context, index) =>
            list[index].senderName == "Demo Patient"
                ? BubbleFreind(message: list[index])
                : BubbleText(conversion: list[index]));
  }
}
