import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class MedicalSpecialty extends StatelessWidget {
  final String? title;
  const MedicalSpecialty({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title?.isNotEmpty == true ? title! : 'Specialty',
      style: AppTextStyles.montserratRegular14(context),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
