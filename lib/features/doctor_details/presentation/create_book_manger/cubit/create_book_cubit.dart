import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/features/doctor_details/domain/repo/create_book_repo.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/create_book_manger/cubit/create_book_state.dart';

class CreateBookCubit extends Cubit<CreateBookState> {
  CreateBookCubit({required this.createBookRepo})
      : super(CreateBookintialState());
  final CreateBookRepo createBookRepo;
  Future<void> create(
      {required int doctorId,
      required String appointmentDate,
      required String appointmentTime}) async {
    emit(CreateBookLoadingState());
    var result = await createBookRepo.createBook(
        doctorId: doctorId,
        appointmentDate: appointmentDate,
        appointmentTime: appointmentTime);
    result.fold((failure) {
      log('create book ===========================failure is ${failure.errormessage}');
      emit(CreateBookFailureState(errorMessage: failure.errormessage));
    }, (bookingId) {
      log('create book ===========================succes');
      emit(CreateBookSuccessState(bookingId: bookingId));
    });
  }
}
