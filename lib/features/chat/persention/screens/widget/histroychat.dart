import 'package:cure_team_1_update/core/function/helperfunction.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';

import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';

import 'package:cure_team_1_update/features/chat/persention/screens/widget/imageprofile.dart';

import 'package:flutter/material.dart';

class Histroychat extends StatelessWidget {
  const Histroychat({super.key, required this.massage, required this.fun});
  final Conversion massage;
  final void Function()? fun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorsLight.offWhite,
        ),
        child: InkWell(
          onTap: fun,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              leading: Imageprofile(image: massage.otherUser?.avatar),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    massage.otherUser?.name ?? 'Unknown',
                    style: AppTextStyles.styleMedium20(context),
                  ),
                  Text(
                    massage.lastMessage?.body ?? 'Start messages',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.styleLarge16(context),
                  ),
                ],
              ),
              trailing: Column(children: [
                Text(
                  _safeTime(massage.updatedAt),
                  style: AppTextStyles.styleLarge16(context),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: (massage.unreadCount ?? 0) == 0
                      ? const SizedBox.shrink()
                      : Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${massage.unreadCount}',
                              style: AppTextStyles.styleLarge16(context),
                            ),
                          ),
                        ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

String _safeTime(String? value) {
  if (value == null || value.isEmpty) {
    return '--';
  }
  final parsed = DateTime.tryParse(value);
  if (parsed == null) {
    return '--';
  }
  return formatTimeToHourMinute(value);
}
