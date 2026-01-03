import 'package:cure_team_1_update/core/style/colors/colors_light.dart';

import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';

import 'package:cure_team_1_update/features/chat/persention/screens/widget/chat_time_formatter.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/imageprofile.dart';

import 'package:flutter/material.dart';

class Histroychat extends StatelessWidget {
  const Histroychat({super.key, required this.massage, required this.fun});
  final Conversion massage;
  final void Function()? fun;

  @override
  Widget build(BuildContext context) {
    final unreadCount = massage.unreadCount ?? 0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        color: ColorsLight.inputFill,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: fun,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                Imageprofile(image: massage.otherUser?.avatar, size: 46),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        massage.otherUser?.name ?? 'Unknown',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.montserratMedum16(context)
                            .copyWith(color: ColorsLight.prussianBlue),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        massage.lastMessage?.body ?? 'Start messages',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.montserratRegular12(context)
                            .copyWith(color: ColorsLight.textGrey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      safeChatTime(massage.updatedAt),
                      style: AppTextStyles.montserratRegular12(context).copyWith(
                        color: unreadCount > 0
                            ? ColorsLight.green
                            : ColorsLight.textGrey,
                      ),
                    ),
                    const SizedBox(height: 6),
                    if (unreadCount > 0)
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          color: ColorsLight.green,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            unreadCount.toString(),
                            style: AppTextStyles.montserratRegular12(context)
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
