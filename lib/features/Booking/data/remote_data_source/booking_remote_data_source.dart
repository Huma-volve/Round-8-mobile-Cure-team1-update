

import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/Booking/data/models/myBooking_model.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:dio/dio.dart';

abstract class BookingRemoteDataSource {
  Future<List<MyBookingEntity>> getBookingData();
}

class BookingRemoteDataSourceImpl extends BookingRemoteDataSource {
  final Dio dio;
  BookingRemoteDataSourceImpl({required this.dio});
  @override
  Future<List<MyBookingEntity>> getBookingData() async {
    
    Map<String, dynamic> headers = {
      'Authorization':'Bearer 12|5WiTxEsY5tYzAAxVuOi2Bz68Iaha83q17H9zqihUf7f38582',
        'Accept': 'application/json',
    };
    dynamic result = await ApiServices(dio).get('bookings', headers);
    List<MyBookingEntity> allBooks = (result['data'] as List)
        .map((book) => MybookingModel.fromjson(book))
        .toList();
   
    return allBooks;
  }
}
