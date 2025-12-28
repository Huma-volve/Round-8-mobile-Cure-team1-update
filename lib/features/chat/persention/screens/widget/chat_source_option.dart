import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChatSourceOption extends StatelessWidget {
  const ChatSourceOption({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: ColorsLight.border),
          color: ColorsLight.inputFill,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: ColorsLight.prussianBlue, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppTextStyles.montserratMedum14(context)
                  .copyWith(color: ColorsLight.prussianBlue),
            ),
          ],
        ),
      ),
    );
  }
}
