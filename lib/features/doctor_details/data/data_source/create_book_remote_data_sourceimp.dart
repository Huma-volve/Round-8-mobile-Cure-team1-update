import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:cure_team_1_update/features/doctor_details/data/data_source/create_book_remote_data_source.dart';

class CreateBookRemoteDataSourceImp extends CreateBookRemoteDataSource {
  final ApiServices apiServices;
  CreateBookRemoteDataSourceImp({required this.apiServices});
  @override
  Future<int> createBook(
      {required int doctorId,
      required String appointmentDate,
      required String appointmentTime}) async {
    final token = Cachehelper.getToken();
    if (token == null || token.isEmpty) {
      throw Exception('Unauthenticated.');
    }
    final response = await apiServices.post2(
        endpoint: 'bookings',
        body: {
          "doctor_id": doctorId,
          "appointment_date": appointmentDate,
          "appointment_time": appointmentTime,
          "payment_method": "stripe",
          "notes": "Doctor $doctorId"
        },
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        });
    if (response is Map<String, dynamic>) {
      final data = response['data'];
      if (data is Map<String, dynamic>) {
        final bookingId = data['id'];
        if (bookingId is int) {
          return bookingId;
        }
        if (bookingId is String) {
          final parsed = int.tryParse(bookingId);
          if (parsed != null) {
            return parsed;
          }
        }
      }
    }
    throw Exception('Failed to create booking.');
  }
}
