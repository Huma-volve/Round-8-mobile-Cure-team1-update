import 'package:cure_team_1_update/core/extensions/context_extension.dart';
import 'package:cure_team_1_update/core/style/responsive_size.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: SvgPicture.asset(Assets.resourceImagesBackarrow)),
                const Spacer(),
                Text('Notifications',
                    style: AppTextStyles.styleLarge26(context).copyWith(
                        fontSize: responsive_size(context, fontsize: 26))),
                const Spacer(),
              ],
            ),
            const Spacer(),
            Image.asset(Assets.resourceImagesZzzz),
            Text(
              'Nothing to display here!',
              style: AppTextStyles.styleSmall26(context).copyWith(
                  fontSize: responsive_size(context, fontsize: 23),
                  color: Colors.black),
            ),
            Text(
              'We’ll notify you once we have new notifications.',
              style: AppTextStyles.styleLarge16(context)
                  .copyWith(color: const Color(0xff6D7379), fontSize: 15),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
