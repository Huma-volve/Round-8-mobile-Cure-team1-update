import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatMessageComposer extends StatelessWidget {
  const ChatMessageComposer({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onAttach,
    required this.onCamera,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onAttach;
  final VoidCallback onCamera;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: ColorsLight.inputFill,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: ColorsLight.border),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        textInputAction: TextInputAction.send,
                        onSubmitted: (_) => onSend(),
                        decoration: InputDecoration(
                          hintText: 'Message',
                          hintStyle: AppTextStyles.montserratRegular14(context)
                              .copyWith(color: ColorsLight.textGrey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: onAttach,
                      borderRadius: BorderRadius.circular(20),
                      child: SvgPicture.asset(
                        Assets.resourceImagesPaperclip,
                        width: 18,
                        height: 18,
                        color: ColorsLight.textGrey,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: onCamera,
                      borderRadius: BorderRadius.circular(20),
                      child: SvgPicture.asset(
                        Assets.resourceImagesCamera,
                        width: 18,
                        height: 18,
                        color: ColorsLight.textGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: onSend,
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: ColorsLight.royalBlue,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
