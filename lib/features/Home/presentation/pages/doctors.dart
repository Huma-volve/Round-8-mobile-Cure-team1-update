
import 'package:flutter/material.dart';

import '../../Data/models/doctor_model.dart';
import '../widgets/doctor_item.dart';


class DoctorsBySpecialtyScreen extends StatelessWidget {
  final String specialtyName;

  const DoctorsBySpecialtyScreen({super.key, required this.specialtyName,});

  @override
  Widget build(BuildContext context) {
    final doctors = doctorsList
        .where((doc) => doc.specialty == specialtyName)
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(specialtyName),
          backgroundColor: Colors.transparent
      ),
      body: doctors.isEmpty
          ? const Center(child: Text("No doctors available"))
          : Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15
            ),
            child: Column(children: [Expanded(
              child: ListView.builder(
                      itemCount: doctors.length,
                      itemBuilder: (context, index) {
              final doctor = doctors[index];

              return DoctorItem(doctor:doctor );
                      },
                    ),
            ),]),
          )
    );
  }
}
