import 'package:flutter/material.dart';

class VoiceMessageWidget extends StatelessWidget {
  final String audioUrl;

  const VoiceMessageWidget({super.key, required this.audioUrl});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.play_arrow),
        Text('Voice message'),
      ],
    );
  }
}
