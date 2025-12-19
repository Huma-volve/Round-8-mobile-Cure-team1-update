import 'package:cure_team_1_update/core/style/colors/colors_light.dart';

import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/chat/data/modle/prfiledatils.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/imageprofile.dart';
import 'package:flutter/material.dart';

class Histroychat extends StatelessWidget {
  const Histroychat({super.key, required this.massage, required this.fun});
  final Prfiledatils? massage;
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
              leading: Imageprofile(image: massage!.image),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    massage!.name,
                    style: AppTextStyles.styleMedium20(context),
                  ),
                  Text(
                    massage!.massage,
                    style: AppTextStyles.styleLarge16(context),
                  ),
                ],
              ),
              trailing: Column(children: [
                Text(
                  massage!.time,
                  style: AppTextStyles.styleLarge16(context),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '2',
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
