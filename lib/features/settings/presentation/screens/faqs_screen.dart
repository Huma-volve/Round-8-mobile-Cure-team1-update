import 'package:cure_team_1_update/core/common/widgets/custom_app_bar.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';

import 'package:cure_team_1_update/features/settings/presentation/widgets/fAQ_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FAQsScreen extends StatelessWidget {
  const FAQsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLight.scaffoldBackground,
      appBar: CustomAppBar(
        title: 'FAQs',
        onPressed: () {
          GoRouter.of(context).canPop() ? GoRouter.of(context).pop() : null;
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.0.r),
        child: Column(
          children: [
            const FAQExpansionTile(
              title: 'What is this app used for?',
              content:
                  'This app allows you to search for doctors, book appointments, and consult in person easily from your phone',
            ),
            SizedBox(height: 16.h),
            const FAQExpansionTile(
              title: 'Is the app free to use?',
              content:
                  'Yes, the app is free to download and use for booking appointments.',
            ),
            SizedBox(height: 16.h),
            const FAQExpansionTile(
              title: 'How can I find a doctor?',
              content: 'You can search by name, specialty, or location.',
            ),
            SizedBox(height: 16.h),
            const FAQExpansionTile(
              title: 'Can I cancel my appointment?',
              content: 'Yes, you can cancel up to 24 hours before.',
            ),
            SizedBox(height: 16.h),
            const FAQExpansionTile(
              title: 'What payment are supported',
              content: 'We support Credit Cards, PayPal, and Apple Pay.',
            ),
            SizedBox(height: 16.h),
            const FAQExpansionTile(
              title: 'How do I edit my profile?',
              content: 'Go to Profile > Edit Profile.',
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildExpansionTile(int index, String title, String content) {
  //   bool isExpanded = index == 0;
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: ColorsLight.inputFill,
  //       borderRadius: BorderRadius.circular(12.r),
  //     ),
  //     child: Theme(
  //       data: ThemeData().copyWith(dividerColor: Colors.transparent),
  //       child: ExpansionTile(
  //         title: Text(title, style: StyleTextHelper.styleLarge8),
  //         initiallyExpanded: isExpanded,
  //         trailing: isExpanded
  //             ? SvgPicture.asset(
  //                 Assets.settingsMinusSign,
  //                 width: 12.w,
  //                 height: 12.w,
  //                 colorFilter: const ColorFilter.mode(
  //                   ColorsLight.textMain,
  //                   BlendMode.srcIn,
  //                 ),
  //               )
  //             : SvgPicture.asset(
  //                 Assets.paymentIcOutlinePaypal,
  //                 width: 12.w,
  //                 height: 12.w,
  //                 colorFilter: const ColorFilter.mode(
  //                   ColorsLight.textMain,
  //                   BlendMode.srcIn,
  //                 ),
  //               ),
  //         childrenPadding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 10.h),
  //         children: [
  //           Divider(),
  //           Text(content, style: StyleTextHelper.styleSmall6)
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
