import 'dart:developer';

import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/doctor_details/data/data_source/create_book_remote_data_source.dart';
import 'package:dio/dio.dart';

class CreateBookRemoteDataSourceImp extends CreateBookRemoteDataSource{
   Map<String, dynamic> headers = {
      'Authorization':'Bearer 12|5WiTxEsY5tYzAAxVuOi2Bz68Iaha83q17H9zqihUf7f38582',
        'Accept': 'application/json',
    };
  @override
  Future<void> createBook({required int doctorId,required String appointmentDate,required String appointmentTime}) async{
  var result=  await  ApiServices(Dio()).post(endpoint: 'bookings', body: {
    "doctor_id": doctorId,
    "appointment_date":appointmentDate,
    "appointment_time":appointmentTime,
    "payment_method": "stripe",
    "notes": "Doctor 2"
}, headers: headers);
log(result.toString());
  }
}