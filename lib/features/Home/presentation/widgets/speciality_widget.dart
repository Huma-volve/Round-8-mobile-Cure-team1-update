import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data/models/specialty_model.dart';
import '../../Doctor/Presentation/cubit/doctor_cubit.dart';
import '../../Doctor/Presentation/cubit/specailty_cubit.dart';
import '../pages/doctors.dart';

class SpecialityWidget extends StatefulWidget {
  final Specialty specialty;

  const SpecialityWidget({
    super.key,
    required this.specialty,
  });

  @override
  State<SpecialityWidget> createState() => _SpecialityWidgetState();
}

class _SpecialityWidgetState extends State<SpecialityWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          final cubit = context.read<DoctorCubit>();

          if (cubit.allDoctors.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('جاري تحميل الدكاترة...')),
            );
            return;
          }

          cubit.filterBySpecialty(widget.specialty.id);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DoctorsBySpecialtyScreen(
                specialtyName: widget.specialty.name,
              ),
            ),
          );

      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.specialty.icon,
                size: 18, fontWeight: FontWeight.w400, color: Colors.black87),
            const SizedBox(width: 6),
            Text(
              widget.specialty.name,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
