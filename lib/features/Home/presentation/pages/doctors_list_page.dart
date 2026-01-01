import 'package:cure_team_1_update/features/Home/Data/models/doctor_api_model.dart';
import 'package:flutter/material.dart';

import '../../Data/models/doctor_model.dart';
import '../widgets/doctor_item.dart';

class DoctorsListPage extends StatelessWidget {
  final String title;
  final List<ApiDoctor> doctors;

  const DoctorsListPage({
    super.key,
    required this.title,
    required this.doctors,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: doctors.isEmpty
          ? const Center(child: Text('No doctors available'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: doctors.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 12);
              },
              itemBuilder: (context, index) {
                return ApiDoctorItem(doctor: doctors[index]);              },
            ),
    );
  }
}
