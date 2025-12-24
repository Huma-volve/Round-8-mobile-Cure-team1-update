import 'package:cure_team_1_update/core/common/toast/show_toast.dart';
import 'package:cure_team_1_update/core/common/widgets/custom_app_bar.dart';
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';

import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_request_body.dart';
import 'package:cure_team_1_update/features/settings/data/models/edit_profile/change_password_response.dart';
import 'package:cure_team_1_update/features/settings/presentation/view_model/bloc/change_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/custom_widgets.dart';

class PasswordManagementScreen extends StatefulWidget {
  const PasswordManagementScreen({super.key});

  @override
  State<PasswordManagementScreen> createState() =>
      _PasswordManagementScreenState();
}

class _PasswordManagementScreenState extends State<PasswordManagementScreen> {
  late ChangePasswordBloc _bloc;
  late final TextEditingController currentPasswordController;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;
  @override
  void initState() {
    super.initState();
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    _bloc = context.read<ChangePasswordBloc>();
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getit<ChangePasswordBloc>(),
      child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
        listener: (context, state) {
          state.whenOrNull(success: (changePasswordResponse) {
            showToast(
              context: context,
              text: '${changePasswordResponse.message} \n',
              colorText: ColorsLight.green,
              toastState: ToastStates.SUCCECC,
            );
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Password changed successfully!'),
              ),
            );
          }, error: (message) {
            showToast(
              context: context,
              text: message,
              colorText: ColorsLight.error,
              toastState: ToastStates.ERROR,
            );
            print('listener state: $state');
          });
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorsLight.scaffoldBackground,
            appBar: CustomAppBar(
                title: 'Password management',
                onPressed: () {
                  Navigator.of(context).pop();
                }
                //  => GoRouter.of(context).canPop()
                //     ? GoRouter.of(context).pop()
                //     : null,
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
                      controller: currentPasswordController,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _bloc.obscureCurrent
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: ColorsLight.textGrey,
                          size: 10.sp,
                        ),
                        onPressed: () {
                          // setState(() {
                          //   _bloc.obscureCurrent = !_bloc.obscureCurrent;
                          // });
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
                      controller: newPasswordController,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _bloc.obscureNew
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: ColorsLight.textGrey,
                          size: 10.sp,
                        ),
                        onPressed: () {
                          // setState(() {
                          //   _bloc.obscureNew = !_bloc.obscureNew;
                          // });
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
                      controller: confirmPasswordController,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _bloc.obscureConfirm
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: ColorsLight.textGrey,
                          size: 10.sp,
                        ),
                        onPressed: () {
                          // setState(() {
                          //   _bloc.obscureConfirm = !_bloc.obscureConfirm;
                          // });
                        },
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm new password';
                        }
                        if (value != newPasswordController.text) {
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
          );
        },
      ),
    );
  }

  void _changePassword() {
    if (_bloc.formKey.currentState!.validate()) {
      // Mock API call

      context.read<ChangePasswordBloc>().add(
            ChangePasswordEvent.changePassword(
              data: ChangePasswordRequestBody(
                current_password: currentPasswordController.text,
                new_password: newPasswordController.text,
                new_password_confirmation: confirmPasswordController.text,
              ),
            ),
          );
    }
  }
}
