import 'package:cure_team_1_update/core/function/helperfunction.dart';
import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:cure_team_1_update/features/chat/data/modle/massagemodel/messagemodle.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/imagemessage.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/textmessage.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/videomessage.dart';
import 'package:flutter/material.dart';

class BubbleText extends StatelessWidget {
  final Historymasseges conversion;
  const BubbleText({super.key, required this.conversion});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          decoration: const BoxDecoration(
              color: Color(0xffBBC1C7),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(28),
                  bottomRight: Radius.circular(28))),
          child: conversion.type == 'text'
              ? Textmessage(
                  message: conversion,
                )
              : conversion.type == 'video'
                  ? BubbleVideo(
                      message: conversion,
                    )
                  : ImageMessageWidget(message: conversion)),
    );
  }
}
