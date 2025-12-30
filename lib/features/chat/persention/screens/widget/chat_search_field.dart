import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatSearchField extends StatelessWidget {
  const ChatSearchField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: ColorsLight.inputFill,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: ColorsLight.border),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.resourceImagesMagnifer,
            width: 18,
            height: 18,
            color: ColorsLight.textGrey,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: 'Search for chat, doctor',
                hintStyle: AppTextStyles.montserratRegular14(context)
                    .copyWith(color: ColorsLight.textGrey),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
