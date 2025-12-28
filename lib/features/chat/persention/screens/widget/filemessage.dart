import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:flutter/material.dart';

class FileMessageWidget extends StatelessWidget {
  const FileMessageWidget({
    super.key,
    required this.message,
    required this.isOutgoing,
  });

  final Historymasseges message;
  final bool isOutgoing;

  @override
  Widget build(BuildContext context) {
    final fileName = _fileNameFromUrl(
      message.attachment ?? message.body ?? 'Attachment',
    );
    final textColor = isOutgoing ? Colors.white : const Color(0xFF1F2937);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.insert_drive_file, color: textColor, size: 18),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            fileName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: textColor, fontSize: 14),
          ),
        ),
      ],
    );
  }
}

String _fileNameFromUrl(String value) {
  final uri = Uri.tryParse(value);
  if (uri != null && uri.pathSegments.isNotEmpty) {
    return uri.pathSegments.last;
  }
  final parts = value.split('/');
  return parts.isNotEmpty ? parts.last : value;
}
