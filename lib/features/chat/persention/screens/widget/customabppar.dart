import 'package:cure_team_1_update/core/style/responsive_size.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';

import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Customabppar extends StatefulWidget {
  const Customabppar({super.key});

  @override
  State<Customabppar> createState() => _AbpparState();
}

class _AbpparState extends State<Customabppar> with TickerProviderStateMixin {
  bool _open = false;

  late final AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _fadeController.forward();
      } else {
        _fadeController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Chat',
          style: AppTextStyles.stylegeorgia27(context)
              .copyWith(fontSize: responsive_size(context, fontsize: 27)),
        ),
        const Spacer(),
        Row(children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            child: Row(children: [
              if (_open) ...[
                FadeTransition(
                  opacity: _fadeController,
                  child: SvgPicture.asset(Assets.resourceImagesTrashBinTrash),
                ),
                const SizedBox(width: 8),
                FadeTransition(
                    opacity: _fadeController,
                    child: SvgPicture.asset(Assets.resourceImagesPin)),
                const SizedBox(width: 8),
                FadeTransition(
                  opacity: _fadeController,
                  child: SvgPicture.asset(Assets.resourceImagesVolumeCross),
                ),
              ]
            ]),
          ),
          InkWell(
            onTap: () {
              _toggle();
            },
            child: SvgPicture.asset(
              Assets.resourceImagesDot,
              width: 30.w,
              height: 30.h,
            ),
          ),
        ])
      ],
    );
  }
}
