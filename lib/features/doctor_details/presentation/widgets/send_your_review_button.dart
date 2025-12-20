import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/custom_elevated_button.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/functions/build_dialog.dart';
import 'package:flutter/material.dart';

class SendYourReviewButton extends StatelessWidget {
  const SendYourReviewButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
        buttonName: 'Send your review', onPressed: () => buildDialog(context));
  }
}
