import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/imageprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Abpperchatbody extends StatelessWidget {
  const Abpperchatbody({super.key, required this.convers});
  final Conversion convers;
  @override
  Widget build(BuildContext context) {
    final otherUser = convers.otherUser;
    final name = otherUser?.name ?? 'Unknown';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          InkWell(
            onTap: () => context.pop(),
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: SvgPicture.asset(
                Assets.resourceImagesBackarrow,
                width: 18,
                height: 18,
                color: ColorsLight.prussianBlue,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Imageprofile(image: otherUser?.avatar, size: 36),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.montserratMedum16(context)
                  .copyWith(color: ColorsLight.prussianBlue),
            ),
          ),
          const SizedBox(width: 8),
          SvgPicture.asset(
            Assets.resourceImagesVideocamera,
            width: 20,
            height: 20,
            color: ColorsLight.prussianBlue,
          ),
          const SizedBox(width: 10),
          SvgPicture.asset(
            Assets.resourceImagesCall,
            width: 20,
            height: 20,
            color: ColorsLight.prussianBlue,
          ),
          const SizedBox(width: 10),
          SvgPicture.asset(
            Assets.resourceImagesDot,
            width: 20,
            height: 20,
            color: ColorsLight.prussianBlue,
          ),
        ],
      ),
    );
  }
}
