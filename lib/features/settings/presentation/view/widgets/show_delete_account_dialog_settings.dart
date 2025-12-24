import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
import 'package:cure_team_1_update/core/widgets/custom_widgets.dart';
import 'package:cure_team_1_update/features/profile/presentation/screens/profile_screen.dart';
import 'package:cure_team_1_update/features/settings/presentation/view_model/delete_account/delete_account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showLogoutDialogSettings(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => BlocProvider(
      create: (context) => getIt<DeleteAccountBloc>(),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.delete,
                color: ColorsLight.error,
                size: 18.sp,
              ),
              SizedBox(height: 8.h),
              Text(
                'Logout',
                style: StyleTextHelper.textStyle16Bold(context),
              ),
              SizedBox(height: 8.h),
              const Divider(),
              SizedBox(height: 16.h),
              Text(
                'Are you sure you want to delete your account?',
                textAlign: TextAlign.center,
                style: StyleTextHelper.textStyle16Regular(context).copyWith(
                  color: ColorsLight.textMain,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Cancel',
                      backgroundColor: Colors.grey,
                      textColor: ColorsLight.textMain,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: CustomButton(
                      text: 'Yes, Logout',
                      onPressed: () {
                        context.read<DeleteAccountBloc>().add(
                              const EventDeleteAccount(),
                            );
                        //if success in deleting account
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                        // Perform logout implementation
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
