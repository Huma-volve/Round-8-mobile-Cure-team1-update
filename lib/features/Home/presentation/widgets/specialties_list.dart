import 'package:flutter/material.dart';

import '../../Data/models/specialty_model.dart';
import '../pages/doctors.dart';

class SpecialtiesList extends StatefulWidget {
  const SpecialtiesList({super.key});

  @override
  State<SpecialtiesList> createState() => _SpecialtiesListState();
}

class _SpecialtiesListState extends State<SpecialtiesList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ListView.separated(
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final spec = Specialty.specialties[index];

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DoctorsBySpecialtyScreen(
                      specialtyName: spec.name,
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.25),
                    width: 0.8,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(spec.icon, size: 16),
                    const SizedBox(width: 4),
                    Text(spec.name),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: Specialty.specialties.length),
    );
  }
}
