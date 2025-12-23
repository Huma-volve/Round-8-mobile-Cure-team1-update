import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Widget buildMenuItem({
  required String assetPath,
  required String title,
  required VoidCallback onTap,
  double? iconWidth,
  required BuildContext context,
}) {
  return Container(
    decoration: BoxDecoration(
      color: ColorsLight.inputFill,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(
        assetPath,
        width: iconWidth ?? 10.w,
        height: iconWidth ?? 10.w,
        colorFilter: const ColorFilter.mode(
          ColorsLight.textMain,
          BlendMode.srcIn,
        ),
      ),
      title: Text(title, style: StyleTextHelper.textStyle12Regular(context)),
      trailing: SvgPicture.asset(
        Assets.profileArrowRight,
        fit: BoxFit.contain,
      ),
    ),
  );
}
