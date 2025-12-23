import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/features/Booking/domain/repo/my_book_repo.dart';
import 'package:cure_team_1_update/features/Booking/presentation/manager/get_book/cubit/booking_state.dart';



class BookingCubit extends Cubit<BookingState> {
  final MyBookRepo myBookRepo;
 
  BookingCubit({required this.myBookRepo}) : super(BookingIntialState());
Future<void>  getBookingData({required String selectedData})async{
  emit(BookingLoadingState());
var result=  await myBookRepo.getMyBooking();
result.fold((failuer){
  log('Booking cubit error is ---------------------->${failuer.errormessage}');
  emit(BookingFailureState(errorMessege: failuer.errormessage));},(myBooks)=>emit(BookingSuccessState(myBooks: myBooks))

);
  
}
}
