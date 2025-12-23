import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/features/Booking/domain/repo/my_book_repo.dart';
import 'package:cure_team_1_update/features/Booking/presentation/manager/cancel_book/cubit/cancel_boking_state.dart';




class CancelMyBookingCubit extends Cubit<CancelMyBookingState> {

  CancelMyBookingCubit({required  this.myBookRepo}) : super(CancelMyBookingintialState());
 final MyBookRepo myBookRepo;
  cancel({required int bookId,required String body})async{
    emit(CancelMyBookingLoadingState());

      var result=  await myBookRepo.cancelMyBooking(bookId: bookId, body: body);
      result.fold((failure){{
        log('error in CancelMyBooking cubit ==========>${failure.errormessage}');
        emit(CancelMyBookingFailureState(errorMessage: failure.errormessage));
      }
      }, (canceled){
                log(' CancelMyBooking cubit ==========>canceled successfully');
        emit(CancelMyBookingSuccessState());
      })
      ;

  }
}
