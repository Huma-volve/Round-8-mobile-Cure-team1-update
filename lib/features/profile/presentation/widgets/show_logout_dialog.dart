import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/app_toast.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
import 'package:cure_team_1_update/core/widgets/custom_widgets.dart';
import 'package:cure_team_1_update/features/settings/presentation/view_model/logout/logout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void showLogoutDialog(BuildContext context) {
  final rootContext = context;
  showDialog(
    context: context,
    builder: (context) => BlocProvider(
      create: (context) => getit<LogoutBloc>(),
      child: BlocConsumer<LogoutBloc, LogoutState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (logoutResponse) {
              AppToast.show(
                context,
                logoutResponse.message,
                backgroundColor: ColorsLight.green,
              );
              Cachehelper.clearToken();
              Cachehelper.clearUserProfile();
              Navigator.of(context).pop();
              GoRouter.of(rootContext).go(AppRoute.loginPage);
            },
            error: (message) {
              if (message.toLowerCase().contains('unauthenticated')) {
                Cachehelper.clearToken();
                Cachehelper.clearUserProfile();
                Navigator.of(context).pop();
                GoRouter.of(rootContext).go(AppRoute.loginPage);
                return;
              }
              AppToast.show(
                context,
                message,
                backgroundColor: ColorsLight.error,
              );
            },
          );
        },
        builder: (context, state) {
          final bloc = context.read<LogoutBloc>();
          final isLoading = bloc.hasRequested &&
              state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
          return Dialog(
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Logout',
                    style: StyleTextHelper.textStyle28Bold(context),
                  ),
                  SizedBox(height: 12.h),
                  Divider(
                    color: ColorsLight.textGrey.withOpacity(0.3),
                    height: 1,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Are you sure you want to log out?',
                    textAlign: TextAlign.center,
                    style: StyleTextHelper.textStyle16Regular(context).copyWith(
                      color: ColorsLight.textGrey,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'Cancel',
                          backgroundColor: Colors.grey,
                          textColor: ColorsLight.textMain,
                          onPressed:
                              isLoading ? () {} : () => Navigator.pop(context),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: SizedBox(
                          height: 40.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsLight.primaryColor,
                              disabledBackgroundColor:
                                  ColorsLight.primaryColor.withOpacity(0.7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              elevation: 0,
                            ),
                            onPressed: isLoading
                                ? null
                                : () {
                                    final token = Cachehelper.getToken();
                                    if (token == null || token.isEmpty) {
                                      Cachehelper.clearUserProfile();
                                      Navigator.of(context).pop();
                                      GoRouter.of(rootContext)
                                          .go(AppRoute.loginPage);
                                      return;
                                    }
                                    context.read<LogoutBloc>().add(
                                          const EventLogout(),
                                        );
                                  },
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: isLoading
                                  ? Row(
                                      key: const ValueKey('loading'),
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 16.r,
                                          height: 16.r,
                                          child:
                                              const CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        Text(
                                          'Logging out...',
                                          style: StyleTextHelper
                                                  .textStyle16Regular(context)
                                              .copyWith(
                                            color: ColorsLight.offWhite,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      'Yes, logout',
                                      key: const ValueKey('ready'),
                                      style: StyleTextHelper.textStyle16Regular(
                                        context,
                                      ).copyWith(
                                        color: ColorsLight.offWhite,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
