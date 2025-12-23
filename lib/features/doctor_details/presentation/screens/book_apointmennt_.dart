<<<<<<< HEAD
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/book_apointment_body.dart';
import 'package:flutter/material.dart';
=======
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/doctor_details/domain/repo/create_book_repo.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/create_book_manger/cubit/create_book_cubit.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/book_apointment_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
>>>>>>> shaban

class Bookappointment extends StatelessWidget {
  const Bookappointment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateBookCubit(createBookRepo: getit<CreateBookRepo>()),
      child: const Scaffold(
        body: BookApointmentBody(),
      ),
    );
  }
}
