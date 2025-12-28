import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/add_review_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/models/add_review_args.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen({
    super.key,
    this.args,
  });

  final AddReviewArgs? args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddReviewScreenBody(args: args),
    );
  }
}
