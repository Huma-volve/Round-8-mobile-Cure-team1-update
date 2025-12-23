import 'package:cure_team_1_update/core/common/widgets/custom_app_bar.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/style/theme/app_theme.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
import 'package:cure_team_1_update/features/profile/presentation/bloc/bloc/edit_profile_bloc.dart';
import 'package:cure_team_1_update/features/profile/presentation/widgets/build_dropdown.dart';
import 'package:cure_team_1_update/features/profile/presentation/widgets/edit_profile_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/custom_widgets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Controllers
  // Controllers

  late EditProfileBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = context.read<EditProfileBloc>();
  }

  @override
  void dispose() {
    _bloc.nameController.dispose();
    _bloc.emailController.dispose();
    _bloc.phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getit<EditProfileBloc>(),
        child: Scaffold(
          backgroundColor: ColorsLight.scaffoldBackground,
          appBar: CustomAppBar(
            // title: 'Edit Profile',
            onPressed: () {
              Navigator.pop(context);
              GoRouter.of(context).canPop() ? GoRouter.of(context).pop() : null;
            },
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
            ),
            child: Form(
              key: _bloc.formKey,
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
                      style:
                          StyleTextHelper.textStyle20Regular(context).copyWith(
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
                    controller: _bloc.nameController,
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
                    controller: _bloc.emailController,
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
                    controller: _bloc.phoneController,
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
                          value: _bloc.selectedDay,
                          items: _bloc.days,
                          hint: 'Day',
                          onChanged: (val) =>
                              setState(() => _bloc.selectedDay = val),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: buildDropdown(
                          context: context,
                          value: _bloc.selectedMonth,
                          items: _bloc.months.keys.toList(),
                          hint: 'Month',
                          onChanged: (val) =>
                              setState(() => _bloc.selectedMonth = val),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: buildDropdown(
                          context: context,
                          value: _bloc.selectedYear,
                          items: _bloc.years,
                          hint: 'Year',
                          onChanged: (val) =>
                              setState(() => _bloc.selectedYear = val),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 48),
                  const EditProfileButton()
                ],
              ),
            ),
          ),
        ));
  }
}
