import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';

abstract class BookingState {}
class BookingIntialState extends BookingState{}
class BookingLoadingState extends BookingState{}
class BookingSuccessState extends BookingState{
  final List<MyBookingEntity>myBooks;
  BookingSuccessState({required this.myBooks});

}
class BookingFailureState extends BookingState{
  final String errorMessege;
  BookingFailureState({required this.errorMessege});
}
