import 'package:cure_team_1_update/core/common/animations/animate_do.dart';
import 'package:cure_team_1_update/core/common/toast/show_toast.dart';
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/widgets/custom_widgets.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_request_body.dart';
import 'package:cure_team_1_update/features/profile/presentation/bloc/bloc/edit_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return state.maybeWhen(
          loading: () {
            return CustomButton(
              text: 'Saving...',
              onPressed: () {},
            );
          },
          orElse: () {
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
      },
    );
  }

  void _validateThenDoSignUp(BuildContext context) {
    final editProfileBloc = context.read<EditProfileBloc>();

    context.read<EditProfileBloc>().add(
          EditProfileEvent.editProfile(
            data: EditProfileRequestBody(
              name: editProfileBloc.nameController.text,
              email: editProfileBloc.emailController.text,
              phone: editProfileBloc.phoneController.text,
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
