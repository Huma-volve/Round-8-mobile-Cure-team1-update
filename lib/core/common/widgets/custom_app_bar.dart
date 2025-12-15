import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../style/theme/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool centerTitle;
  final Color? backgroundColor;
  final double elevation;
  final double scrolledUnderElevation;
  final List<Widget>? actions;
  final TextStyle? titleStyle;
  final VoidCallback? onPressed;
  const CustomAppBar({
    super.key,
    this.title,
    this.centerTitle = true,
    this.backgroundColor = Colors.transparent,
    this.elevation = 0,
    this.scrolledUnderElevation = 0,
    this.actions,
    this.titleStyle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? '',
        style: titleStyle ??
            StyleTextHelper.textStyle20Regular(context).copyWith(
              fontFamily: 'georgia',
            ),
      ),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor,
      elevation: elevation,
      scrolledUnderElevation: scrolledUnderElevation,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: ColorsLight.blueGray,
        ),
        onPressed: onPressed,
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
