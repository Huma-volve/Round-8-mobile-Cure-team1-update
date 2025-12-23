import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Doctor/Presentation/cubit/doctor_cubit.dart';
import '../../Doctor/Presentation/state/doctor_state.dart';
import '../widgets/doctor_item.dart';

class DoctorsBySpecialtyScreen extends StatelessWidget {
  final String specialtyName;

  const DoctorsBySpecialtyScreen({
    super.key,
    required this.specialtyName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(specialtyName),
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<DoctorCubit, DoctorState>( // ← DoctorCubit مش DoctorsBySpecialtyCubit
        builder: (context, state) {
          if (state is DoctorLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DoctorLoaded) {
            if (state.doctors.isEmpty) {
              return const Center(child: Text("Not found"));
            }

            return ListView.separated(
              itemCount: state.doctors.length,
              itemBuilder: (_, i) => DoctorItem(doctor: state.doctors[i]),
              separatorBuilder: (_, __) => const SizedBox(height: 10),
            );
          }

          if (state is DoctorError) {
            return Center(child: Text(state.message));
          }

          return const Center(child: Text("click"));
        },
      ),
    );
  }
}