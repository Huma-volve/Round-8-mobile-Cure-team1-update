import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/chat_source_option.dart';
import 'package:flutter/material.dart';

Future<void> showChatImageSourceSheet(
  BuildContext context, {
  required VoidCallback onCamera,
  required VoidCallback onGallery,
}) async {
  final rootContext = context;
  await showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (sheetContext) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: ColorsLight.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Choose photo',
                style: AppTextStyles.montserratMedum16(rootContext)
                    .copyWith(color: ColorsLight.prussianBlue),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ChatSourceOption(
                      icon: Icons.camera_alt,
                      label: 'Camera',
                      onTap: () {
                        Navigator.pop(sheetContext);
                        onCamera();
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ChatSourceOption(
                      icon: Icons.photo_library,
                      label: 'Gallery',
                      onTap: () {
                        Navigator.pop(sheetContext);
                        onGallery();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
