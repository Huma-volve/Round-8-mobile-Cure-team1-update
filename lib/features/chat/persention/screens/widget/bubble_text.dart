import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/filemessage.dart';
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.72,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: const BoxDecoration(
              color: Color(0xFFE5E7EB),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: _buildContent(conversion, false),
          ),
        ),
      ),
    );
  }
}

Widget _buildContent(Historymasseges message, bool isOutgoing) {
  final attachment = message.attachment ?? message.body;
  final isImageAttachment = _looksLikeImage(attachment);
  switch (message.type) {
    case 'text':
      return Textmessage(message: message, isOutgoing: isOutgoing);
    case 'video':
      return BubbleVideo(message: message);
    case 'file':
      return isImageAttachment
          ? ImageMessageWidget(message: message)
          : FileMessageWidget(message: message, isOutgoing: isOutgoing);
    case 'image':
      return ImageMessageWidget(message: message);
    default:
      return isImageAttachment
          ? ImageMessageWidget(message: message)
          : Textmessage(message: message, isOutgoing: isOutgoing);
  }
}

bool _looksLikeImage(String? value) {
  if (value == null || value.isEmpty) {
    return false;
  }
  final lower = value.toLowerCase();
  return lower.endsWith('.png') ||
      lower.endsWith('.jpg') ||
      lower.endsWith('.jpeg') ||
      lower.endsWith('.gif') ||
      lower.endsWith('.webp');
}
