import 'package:cure_team_1_update/core/common/animations/animate_do.dart';
import 'package:cure_team_1_update/core/common/toast/show_toast.dart';
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/constants/go_route.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/widgets/custom_widgets.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_request_body.dart';
import 'package:cure_team_1_update/features/profile/presentation/bloc/bloc/edit_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileBloc, EditProfileState>(
      listener: (context, state) {
        state.whenOrNull(success: (_) {
          showToast(
            context: context,
            text: 'successfully edited profile',
            colorText: ColorsLight.green,
            toastState: ToastStates.SUCCECC,
          );
          GoRouter.of(context).go(AppRoute.profileScreen);
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
        final bloc = context.read<EditProfileBloc>();
        final isLoading = bloc.hasRequested &&
            state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );
        if (isLoading) {
          return CustomButton(
            text: 'Saving...',
            onPressed: () {},
          );
        }
        return CustomFadeInRight(
          duration: 600,
          child: CustomButton(
            text: 'Edit Profile',
            onPressed: () {
              _validateThenDoSignUp(context);
            },
          ),
        );
      },
    );
  }

  void _validateThenDoSignUp(BuildContext context) {
    final editProfileBloc = context.read<EditProfileBloc>();
    if (editProfileBloc.selectedDay == null ||
        editProfileBloc.selectedMonth == null ||
        editProfileBloc.selectedYear == null) {
      showToast(
        context: context,
        text: 'Please select your birthday',
        colorText: ColorsLight.error,
        toastState: ToastStates.ERROR,
      );
      return;
    }

    context.read<EditProfileBloc>().add(
          EditProfileEvent.editProfile(
            data: EditProfileRequestBody(
              name: editProfileBloc.nameController.text.trim(),
              email: editProfileBloc.emailController.text.trim(),
              phone: editProfileBloc.phoneController.text.trim(),
              birthdate: editProfileBloc.getFormattedBirthDate(
                day: editProfileBloc.selectedDay!,
                month: editProfileBloc.selectedMonth!,
                year: editProfileBloc.selectedYear!,
              ),
            ),
          ),
        );
  }
}
