import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/abpperchatbody.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/chat_message_composer.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/chatmassges.dart';
import 'package:flutter/material.dart';

class ChatbodyLayout extends StatelessWidget {
  const ChatbodyLayout({
    super.key,
    required this.convers,
    required this.messages,
    required this.scroll,
    required this.controller,
    required this.onSend,
    required this.onAttach,
    required this.onCamera,
  });

  final Conversion convers;
  final List<Historymasseges> messages;
  final ScrollController scroll;
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onAttach;
  final VoidCallback onCamera;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 12),
          Abpperchatbody(convers: convers),
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Chatmassges(
                list: messages,
                scroll: scroll,
                otherUserId: convers.otherUser?.id,
              ),
            ),
          ),
          ChatMessageComposer(
            controller: controller,
            onSend: onSend,
            onAttach: onAttach,
            onCamera: onCamera,
          ),
        ],
      ),
    );
  }
}
