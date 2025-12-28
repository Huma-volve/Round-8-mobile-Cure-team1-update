
import 'package:cure_team_1_update/features/Home/Data/models/api_doctor.dart';
import 'package:cure_team_1_update/features/doctor_details/domain/repo/create_book_repo.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/create_book_manger/cubit/create_book_cubit.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/book_apointment_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
class Bookappointment extends StatelessWidget {
  final ApiDoctor? doctor;
  const Bookappointment({super.key, this.doctor});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateBookCubit(createBookRepo: getIt<CreateBookRepo>()),
      child: Scaffold(
        body: BookApointmentBody(doctor: doctor),
      ),
    );
  }
}
