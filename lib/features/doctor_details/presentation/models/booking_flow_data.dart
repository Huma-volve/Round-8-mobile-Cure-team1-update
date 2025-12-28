import 'package:cure_team_1_update/features/Home/Data/models/api_doctor.dart';

class BookingFlowData {
  final ApiDoctor doctor;
  final int bookingId;
  final String? appointmentDate;
  final String? appointmentTime;

  const BookingFlowData({
    required this.doctor,
    required this.bookingId,
    this.appointmentDate,
    this.appointmentTime,
  });
}
