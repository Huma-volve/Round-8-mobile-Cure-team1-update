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
          GoRouter.of(context).pushReplacementNamed(AppRoute.profileScreen);
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
            print('loading....');
            return CustomButton(
              text: 'Edit Profile',
              onPressed: () {
                _validateThenDoSignUp(context);
              },
            );
          },
          orElse: () {
            print('asdfasfdafaf....');

            return CustomFadeInRight(
              duration: 600,
              child: CustomButton(
                text: 'Edit Profile',
                onPressed: () {
                  // Save Logic
                  // _validateThenDoSignUp(context);
                },
              ),
            );
          },
        );
      },
    );
  }

  void _validateThenDoSignUp(BuildContext context) {
    print('validate then do edit profile');
    final editProfileBloc = context.read<EditProfileBloc>();

    // showToast(
    //   context: context,
    //   text: 'please fill all fields',
    //   colorText: ColorsLight.offWhite,
    //   toastState: ToastStates.ERROR,
    // );
    print('oooooooooooooooooooo');
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
