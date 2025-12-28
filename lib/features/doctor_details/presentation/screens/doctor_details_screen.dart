import 'package:cure_team_1_update/features/Home/Data/models/api_doctor.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_screen_body.dart';
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final ApiDoctor? doctor;

  const DoctorDetailsScreen({super.key, this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoctorDetailsScreenBody(doctor: doctor),
    );
  }
}
