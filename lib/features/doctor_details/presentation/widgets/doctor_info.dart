import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_info_location.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/medical_spcialist.dart';
import 'package:flutter/material.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dr. Jessica Turner',
          style: AppTextStyles.georgiaRegular20(context)
              .copyWith(color: ColorsLight.prussianBlue),
        ),
        const MedicalSpecialty(),
        const DoctorInfoLocation(),
      ],
    );
  }
}
