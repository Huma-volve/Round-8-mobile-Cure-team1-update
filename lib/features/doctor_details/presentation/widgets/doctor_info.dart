import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/features/Home/Data/models/api_doctor.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_info_location.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/medical_spcialist.dart';
import 'package:flutter/material.dart';

class DoctorInfo extends StatelessWidget {
  final ApiDoctor? doctor;
  const DoctorInfo({
    super.key,
    this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          doctor?.name ?? 'Doctor',
          style: AppTextStyles.georgiaRegular20(context)
              .copyWith(color: ColorsLight.prussianBlue),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        MedicalSpecialty(title: doctor?.specialty),
        const SizedBox(height: 6),
        DoctorInfoLocation(
          location: _resolvedAddress(doctor),
        ),
      ],
    );
  }
}

String? _resolvedAddress(ApiDoctor? doctor) {
  if (doctor == null) {
    return null;
  }
  if (doctor.address.isNotEmpty) {
    return doctor.address;
  }
  return null;
}
