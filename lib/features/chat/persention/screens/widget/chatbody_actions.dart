import 'dart:io';

import 'package:cure_team_1_update/core/utils/app_toast.dart';
import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/chat_attachment_sender.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ChatbodyActions {
  ChatbodyActions({ImagePicker? imagePicker, ChatAttachmentSender? sender})
      : _imagePicker = imagePicker ?? ImagePicker(),
        _sender = sender ?? ChatAttachmentSender();

  final ImagePicker _imagePicker;
  final ChatAttachmentSender _sender;

  void sendText(
    BuildContext context,
    Conversion convers,
    TextEditingController controller,
    ScrollController scroll,
  ) =>
      _sender.sendText(context, convers, controller, scroll);

  Future<void> pickCamera(
    BuildContext context,
    Conversion convers,
    TextEditingController controller,
    ScrollController scroll,
  ) async {
    final image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    await _sender.sendAttachment(
      context,
      convers,
      File(image.path),
      controller,
      scroll,
    );
  }

  Future<void> pickGallery(
    BuildContext context,
    Conversion convers,
    TextEditingController controller,
    ScrollController scroll,
  ) async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    await _sender.sendAttachment(
      context,
      convers,
      File(image.path),
      controller,
      scroll,
    );
  }

  Future<void> pickFile(
    BuildContext context,
    Conversion convers,
    TextEditingController controller,
    ScrollController scroll,
  ) async {
    FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles();
    } on MissingPluginException {
      if (context.mounted) {
        AppToast.show(context, 'File picker not available. Restart the app.');
      }
      return;
    }
    if (result == null || result.files.isEmpty) {
      return;
    }
    final pickedPath = result.files.single.path;
    if (pickedPath == null) {
      return;
    }
    await _sender.sendAttachment(
      context,
      convers,
      File(pickedPath),
      controller,
      scroll,
    );
  }
}
