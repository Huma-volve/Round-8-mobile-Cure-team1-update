import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/features/Booking/domain/repo/my_book_repo.dart';
import 'package:cure_team_1_update/features/Booking/presentation/manager/update_book/cubit/update_booking_state.dart';

class UpdateBookingCubit extends Cubit<UpdateBookingState> {
  final MyBookRepo myBookRepo;

  UpdateBookingCubit({required this.myBookRepo})
      : super(UpdateBookingInitialState());

  Future<void> updateBooking(
      {required int bookId,
      required String appointmentDate,
      required String appointmentTime}) async {
    emit(UpdateBookingLoadingState());
    final result = await myBookRepo.updateMyBooking(
      bookId: bookId,
      appointmentDate: appointmentDate,
      appointmentTime: appointmentTime,
    );
    result.fold((failure) {
      log('update booking error: ${failure.errormessage}');
      emit(UpdateBookingFailureState(errorMessage: failure.errormessage));
    }, (_) {
      emit(UpdateBookingSuccessState());
    });
  }
}
