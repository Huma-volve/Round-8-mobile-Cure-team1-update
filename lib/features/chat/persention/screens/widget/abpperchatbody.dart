import 'package:cure_team_1_update/core/style/responsive_size.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              context.pop();
            },
            child: SvgPicture.asset(
              Assets.resourceImagesBackarrow,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Imageprofile(
            image: otherUser?.avatar,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            name,
            style: AppTextStyles.styleLarge20(context)
                .copyWith(fontSize: responsive_size(context, fontsize: 20)),
          ),
          const SizedBox(
            width: 15,
          ),
          const Spacer(),
          SvgPicture.asset(Assets.resourceImagesVideocamera),
          const SizedBox(
            width: 10,
          ),
          SvgPicture.asset(Assets.resourceImagesCall),
          const SizedBox(
            width: 10,
          ),
          SvgPicture.asset(Assets.resourceImagesDot),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
