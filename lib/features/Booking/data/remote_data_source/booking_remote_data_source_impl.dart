

import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/Booking/data/models/myBooking_model.dart';
import 'package:cure_team_1_update/features/Booking/data/remote_data_source/booking_remote_data_source.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:dio/dio.dart';

class BookingRemoteDataSourceImpl extends BookingRemoteDataSource {
  final Dio dio;
  BookingRemoteDataSourceImpl({required this.dio});
  Map<String, dynamic> headers = {
      'Authorization':'Bearer 12|5WiTxEsY5tYzAAxVuOi2Bz68Iaha83q17H9zqihUf7f38582',
        'Accept': 'application/json',
    };
  @override
  Future<List<MyBookingEntity>> getBookingData() async {
    dynamic result = await ApiServices(dio).get('bookings', headers);
    List<MyBookingEntity> allBooks = (result['data'] as List)
        .map((book) => MybookingModel.fromjson(book))
        .toList();
   
    return allBooks;
  }
  
  @override
  Future<void> cancelMyBooking({required int bookId,required String body}) async{
   
  await ApiServices(dio).post(endpoint:"bookings/$bookId/cancel", body: {"cancellation_reason": body}, headers: headers);

  }
}
