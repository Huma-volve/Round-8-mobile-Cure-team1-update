import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';

abstract class BookingRemoteDataSource {
  Future<List<MyBookingEntity>> getBookingData();
  Future<void> cancelMyBooking({required int bookId,required String body});
  Future<void> updateMyBooking(
      {required int bookId,
      required String appointmentDate,
      required String appointmentTime});
}
