import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
import 'package:cure_team_1_update/features/profile/presentation/widgets/build_menu_item.dart';
import 'package:cure_team_1_update/features/profile/presentation/widgets/show_logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/custom_widgets.dart';
import '../../../settings/presentation/view/screens/settings_screen.dart';
import '../../../payment/presentation/screens/payment_methods_screen.dart';
import 'edit_profile_screen.dart';
import '../../../settings/presentation/view/screens/faqs_screen.dart';
import '../../../settings/presentation/view/screens/privacy_policy_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    final cachedName = Cachehelper.getUserName();
    final displayName = (cachedName != null && cachedName.trim().isNotEmpty)
        ? cachedName.trim()
        : 'Your profile';
    final cachedEmail = Cachehelper.getUserEmail();
    final cachedPhone = Cachehelper.getUserPhone();
    final subtitleText = (cachedEmail != null && cachedEmail.isNotEmpty)
        ? cachedEmail
        : (cachedPhone != null && cachedPhone.isNotEmpty ? cachedPhone : null);
    final subtitleIcon = (cachedEmail != null && cachedEmail.isNotEmpty)
        ? Icons.email_outlined
        : (cachedPhone != null && cachedPhone.isNotEmpty
            ? Icons.phone
            : null);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsLight.scaffoldBackground,
        body: SingleChildScrollView(
            padding: EdgeInsets.all(24.r),
            child: Column(children: [
              // User Info Card
              SizedBox(height: 12.h),
              Container(
                decoration: BoxDecoration(
                    color: ColorsLight.inputFill,
                    borderRadius: BorderRadius.all(Radius.circular(10.r))),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 22.r,
                      backgroundImage: const NetworkImage(
                        'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
                      ), // Placeholder
                      backgroundColor: Colors.grey,
                    ),
                    subtitle: subtitleText != null && subtitleIcon != null
                        ? Row(children: [
                            Icon(
                              subtitleIcon,
                              size: 8.sp,
                              color: ColorsLight.textGrey,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              subtitleText,
                              style: StyleTextHelper.textStyle12Regular(context)
                                  .copyWith(color: ColorsLight.blueGray),
                            ),
                          ])
                        : null,
                    title: Text(
                      displayName,
                      style: StyleTextHelper.textStyle20Regular(context)
                          .copyWith(fontFamily: 'georgia'),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        GoRouter.of(context).push(AppRoute.editProfileScreen);
                      },
                      child: SvgPicture.asset(
                        Assets.profileArrowRight,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),

              // Settings List
              Container(
                decoration: BoxDecoration(
                  color: ColorsLight.inputFill,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                ),
                child: SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  secondary: SvgPicture.asset(
                    Assets.profileNotification,
                    width: 24.w,
                    height: 24.h,
                    colorFilter: const ColorFilter.mode(
                      ColorsLight.textMain,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text('Notification',
                      style: StyleTextHelper.textStyle16Regular(context)),
                  value: _notificationEnabled,
                  activeThumbColor: ColorsLight.offWhite, // As per design
                  // activeThumbColor: ColorsLight.,
                  activeTrackColor: ColorsLight.green,

                  onChanged: (val) {
                    setState(() {
                      _notificationEnabled = val;
                    });
                  },
                ),
              ),
              SizedBox(height: 16.h),

              buildMenuItem(
                context: context,
                assetPath: Assets.profileGroupAddCard,
                iconWidth: 8.w,
                title: 'Payment Method',
                onTap: () {
                  GoRouter.of(context)
                      .push(AppRoute.paymentScreenpaymentScreen);
                },
              ),
              SizedBox(height: 16.h),
              buildMenuItem(
                context: context,
                assetPath: Assets.profileHeart,
                title: 'Favorite',
                onTap: () {},
              ),
              SizedBox(height: 16.h),
              buildMenuItem(
                context: context,
                assetPath: Assets.profileSettings,
                title: 'Settings',
                onTap: () {
                  GoRouter.of(context).push(AppRoute.settingsScreen);
                },
              ),
              SizedBox(height: 16.h),
              buildMenuItem(
                context: context,
                assetPath: Assets.profileChat,
                title: 'FAQs',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FaqsScreen()));
                  GoRouter.of(context).push(AppRoute.faqsScreen);
                },
              ),
              SizedBox(height: 16.h),
              buildMenuItem(
                context: context,
                assetPath: Assets.settingsLockKeyhole,
                title: 'Privacy Policy',
                onTap: () {
                  GoRouter.of(context).push(AppRoute.privacyPolicyScreen);
                },
              ),
              SizedBox(height: 32.h),
              // Logout Button (Light red background style)
              Container(
                decoration: BoxDecoration(
                  color: ColorsLight.inputFill,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ListTile(
                  onTap: () {
                    showLogoutDialog(context);
                  },
                  leading: SvgPicture.asset(
                    Assets.profileLogout,
                    width: 14.w,
                    height: 14.w,
                    fit: BoxFit.contain,
                    colorFilter: const ColorFilter.mode(
                      ColorsLight.error,
                      BlendMode.srcIn,
                    ),
                  ),
                  title: Text('Log out',
                      style: StyleTextHelper.textStyle20Regular(context)
                          .copyWith(color: ColorsLight.error)),
                ),
              )
            ])),
      ),
    );
  }
}
