import 'dart:io';

import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chatbody_cubit/cubit/chatbody_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatAttachmentSender {
  void sendText(
    BuildContext context,
    Conversion convers,
    TextEditingController controller,
    ScrollController scroll,
  ) {
    final text = controller.text.trim();
    if (text.isEmpty) {
      return;
    }
    context.read<ChatbodyCubit>().sendmassge(
          convers.id,
          {"body": text, "type": "text"},
        );
    context.read<ChatbodyCubit>().getmassages(convers);
    _clearAndScroll(controller, scroll);
  }

  Future<void> sendAttachment(
    BuildContext context,
    Conversion convers,
    File file,
    TextEditingController controller,
    ScrollController scroll,
  ) async {
    final body = controller.text.trim();
    final form = FormData.fromMap({
      'body': body.isEmpty ? 'Attachment' : body,
      'attachment': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split(Platform.pathSeparator).last,
      ),
    });
    context.read<ChatbodyCubit>().sendmassge(convers.id, form);
    context.read<ChatbodyCubit>().getmassages(convers);
    _clearAndScroll(controller, scroll);
  }

  void _clearAndScroll(
    TextEditingController controller,
    ScrollController scroll,
  ) {
    controller.clear();
    if (!scroll.hasClients) {
      return;
    }
    scroll.animateTo(
      0,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
    );
  }
}
