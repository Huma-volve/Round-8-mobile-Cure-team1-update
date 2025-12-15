import 'package:cure_team_1_update/core/common/widgets/custom_app_bar.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/style/theme/app_theme.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
import 'package:cure_team_1_update/features/profile/widgets/build_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widgets/custom_widgets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Controllers
  // Controllers
  final _nameController = TextEditingController(text: 'Seif Mohamed');
  final _emailController = TextEditingController(
    text: 'seif_mohamed@Example.com',
  );
  final _phoneController = TextEditingController(text: '+20 123 456 7890');

  // Date selection values
  String? _selectedDay = '29';
  String? _selectedMonth = 'July';
  String? _selectedYear = '2024';

  @override
  void initState() {
    super.initState();
  }

  // Generate lists for dropdowns
  List<String> get _days =>
      List.generate(31, (index) => (index + 1).toString());
  List<String> get _months => [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ];
  // Generate years from 1950 to current year
  List<String> get _years => List.generate(
        DateTime.now().year - 1950 + 1,
        (index) => (1950 + index).toString(),
      ).reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsLight.scaffoldBackground,
      appBar: CustomAppBar(
        // title: 'Edit Profile',
        onPressed: () {
          GoRouter.of(context).canPop() ? GoRouter.of(context).pop() : null;
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
        ),
        child: Column(
          children: [
            // Profile Image
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage: const NetworkImage(
                      'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
                    ),
                    backgroundColor: ColorsLight.offWhite,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      Assets.profileCameraEdit,
                      width: 10.w,
                      height: 10.w,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),

            // User Info
            Text('Seif Mohamed',
                style: StyleTextHelper.textStyle20Regular(context).copyWith(
                  fontFamily: 'georgia',
                )),
            SizedBox(height: 4.h),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.location_on,
                size: 8.sp,
                color: ColorsLight.textGrey,
              ),
              Text(
                '129,El-Nasr Street, Cairo',
                style: StyleTextHelper.textStyle12Regular(context)
                    .copyWith(color: ColorsLight.blueGray),
              ),
            ]),
            SizedBox(height: 40.h),

            // Form Fields
            CustomTextField(
              hintText: 'Full Name',
              controller: _nameController,
              prefixWidget: Padding(
                padding: EdgeInsets.all(12.r),
                child: SvgPicture.asset(
                  Assets.profileFamiconsPerson,
                  width: 10.w,
                  height: 10.w,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              hintText: 'Email',
              controller: _emailController,
              prefixWidget: Padding(
                padding: EdgeInsets.all(10.r),
                child: SvgPicture.asset(
                  Assets.profileMdiEmail,
                  width: 10.w,
                  height: 10.w,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              hintText: 'Phone Number',
              controller: _phoneController,
              prefixWidget: Padding(
                padding: EdgeInsets.all(10.r),
                child: SvgPicture.asset(
                  Assets.profileFlagEgyptEdit,
                  width: 10.w,
                  height: 10.w,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Select your birthday',
                  style: StyleTextHelper.textStyle16Regular(context)),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: buildDropdown(
                    context: context,
                    value: _selectedDay,
                    items: _days,
                    hint: 'Day',
                    onChanged: (val) => setState(() => _selectedDay = val),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: buildDropdown(
                    context: context,
                    value: _selectedMonth,
                    items: _months,
                    hint: 'Month',
                    onChanged: (val) => setState(() => _selectedMonth = val),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: buildDropdown(
                    context: context,
                    value: _selectedYear,
                    items: _years,
                    hint: 'Year',
                    onChanged: (val) => setState(() => _selectedYear = val),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 48),
            CustomButton(
              text: 'Edit Profile',
              onPressed: () {
                // Save Logic
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Changes Saved!')));
              },
            ),
          ],
        ),
      ),
    );
  }
}
