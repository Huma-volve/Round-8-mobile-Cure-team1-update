import 'package:cure_team_1_update/core/common/widgets/custom_app_bar.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/app_toast.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_request_body.dart';
import 'package:cure_team_1_update/features/settings/presentation/bloc/bloc/change_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/custom_widgets.dart';

class PasswordManagementScreen extends StatefulWidget {
  const PasswordManagementScreen({super.key});

  @override
  State<PasswordManagementScreen> createState() =>
      _PasswordManagementScreenState();
}

class _PasswordManagementScreenState extends State<PasswordManagementScreen> {
  late final ChangePasswordBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getit<ChangePasswordBloc>();
  }

  @override
  void dispose() {
    _bloc.currentPasswordController.dispose();
    _bloc.newPasswordController.dispose();
    _bloc.confirmPasswordController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: ColorsLight.scaffoldBackground,
        appBar: CustomAppBar(
          title: 'Password management',
          onPressed: () =>
              GoRouter.of(context).canPop() ? GoRouter.of(context).pop() : null,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24.0.r),
          child: Form(
            key: _bloc.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Current password',
                    style: StyleTextHelper.textStyle16Regular(context)),
                SizedBox(height: 8.h),
                CustomTextField(
                  hintText: '********',
                  obscureText: _bloc.obscureCurrent,
                  controller: _bloc.currentPasswordController,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _bloc.obscureCurrent
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: ColorsLight.textGrey,
                      size: 10.sp,
                    ),
                    onPressed: () {
                      setState(() {
                        _bloc.obscureCurrent = !_bloc.obscureCurrent;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter current password';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 24.h),

                Text('New password',
                    style: StyleTextHelper.textStyle16Regular(context)),
                SizedBox(height: 8.h),
                CustomTextField(
                  hintText: '********',
                  obscureText: _bloc.obscureNew,
                  controller: _bloc.newPasswordController,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _bloc.obscureNew
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: ColorsLight.textGrey,
                      size: 10.sp,
                    ),
                    onPressed: () {
                      setState(() {
                        _bloc.obscureNew = !_bloc.obscureNew;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter new password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 24.h),

                Text('Confirm new password',
                    style: StyleTextHelper.textStyle16Regular(context)),
                SizedBox(height: 8.h),
                CustomTextField(
                  hintText: '********',
                  obscureText: _bloc.obscureConfirm,
                  controller: _bloc.confirmPasswordController,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _bloc.obscureConfirm
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: ColorsLight.textGrey,
                      size: 10.sp,
                    ),
                    onPressed: () {
                      setState(() {
                        _bloc.obscureConfirm = !_bloc.obscureConfirm;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm new password';
                    }
                    if (value != _bloc.newPasswordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 48.h), // Added spacing
                CustomButton(
                  // Bottom button
                  text: 'Change password',
                  onPressed: _changePassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _changePassword() {
    if (_bloc.formKey.currentState!.validate()) {
      // Mock API call

      context.read<ChangePasswordBloc>().add(
            ChangePasswordEvent.changePassword(
              data: ChangePasswordRequestBody(
                current_password: _bloc.currentPasswordController.text,
                new_password: _bloc.newPasswordController.text,
                new_password_confirmation: _bloc.confirmPasswordController.text,
              ),
            ),
          );

      AppToast.show(context, 'Password changed successfully');
      GoRouter.of(context).canPop() ? GoRouter.of(context).pop() : null;
    }
  }
}
