import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:flutter/material.dart';

class ImageMessageWidget extends StatelessWidget {
  final Historymasseges message;

  const ImageMessageWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(message.body!),
    );
  }
}
