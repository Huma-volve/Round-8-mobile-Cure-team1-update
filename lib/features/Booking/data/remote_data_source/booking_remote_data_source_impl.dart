import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/Booking/data/models/myBooking_model.dart';
import 'package:cure_team_1_update/features/Booking/data/remote_data_source/booking_remote_data_source.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:dio/dio.dart';

class BookingRemoteDataSourceImpl extends BookingRemoteDataSource {
  final Dio dio;
  BookingRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<MyBookingEntity>> getBookingData() async {
    dynamic result = await ApiServices(dio).get('bookings');
    List<MyBookingEntity> allBooks = (result['data'] as List)
        .map((book) => MybookingModel.fromjson(book))
        .toList();

    return allBooks;
  }

  @override
  Future<void> cancelMyBooking(
      {required int bookId, required String body}) async {
    await ApiServices(dio).post(
      "bookings/$bookId/cancel",
      {"cancellation_reason": body},
    );
  }

  @override
  Future<void> updateMyBooking(
      {required int bookId,
      required String appointmentDate,
      required String appointmentTime}) async {
    await ApiServices(dio).put(
      "bookings/$bookId",
      {
        "appointment_date": appointmentDate,
        "appointment_time": appointmentTime,
      },
    );
  }
}
