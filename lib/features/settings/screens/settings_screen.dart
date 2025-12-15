import 'package:cure_team_1_update/core/common/widgets/custom_app_bar.dart';
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/style/theme/app_theme.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/profile/widgets/build_menu_item.dart';
import 'package:cure_team_1_update/features/settings/widgets/show_logout_dialog_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/custom_widgets.dart';
import 'password_management_screen.dart'; // Placeholder

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLight.scaffoldBackground,
      appBar: CustomAppBar(
        title: 'Settings',
        onPressed: () {
          GoRouter.of(context).canPop() ? GoRouter.of(context).pop() : null;
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0.r),
        child: Column(
          children: [
            buildMenuItem(
              context: context,
              title: 'Password Management',
              assetPath: Assets.settingsLockKeyhole,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const PasswordManagementScreen();
                  },
                ));
                GoRouter.of(context).push(AppRoute.passwordManagementScreen);
                ;
              },
            ),
            SizedBox(height: 16.h),
            buildMenuItem(
              context: context,
              title: 'Delete Account',
              // Using userRounded or similar as we don't have a specific delete-user SVG
              // If 'minus-sign' was relevant I'd combine it, but simple User icon is safer fallback than broken asset
              assetPath: Assets.settingsUserRounded,
              onTap: () {
                showLogoutDialogSettings(context);
              },
            ),
          ],
        ),
      ),
    );
  }

//Are you sure you want to delete your account?
}
