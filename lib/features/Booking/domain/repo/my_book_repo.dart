import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MyBookRepo {
  Future<Either<Failuer,List<MyBookingEntity>>>getMyBooking();
   Future<Either<Failuer,void>>cancelMyBooking({required int bookId,required String body});
   Future<Either<Failuer,void>>updateMyBooking(
      {required int bookId,
      required String appointmentDate,
      required String appointmentTime});
}
