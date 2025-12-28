



import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/Booking/domain/enums/booking_enum.dart';
import 'package:cure_team_1_update/features/Booking/domain/enums/payment_status_enum.dart';

class MybookingModel extends MyBookingEntity {
@override
  final int docId;
@override
  final int bookId;
  @override
  final String docName;
  @override
  final String docSpciality;
  @override
  final String docAddress;
  @override
  final String? docImage;
  @override
  final BookingEnum bookingStatus;
  @override
  final PaymentStatus paymentStatus;
  @override
  final String bookDate;
  @override
  final String bookHour;
  @override
  final double? price;

  MybookingModel(
      {
      required this.docName,
      required this.docId,
      required this.bookId,
      required this.docSpciality,
      required this.docAddress,
       this.docImage,
      required this.bookingStatus,
      required this.paymentStatus,
      required this.bookDate,
      required this.bookHour,
      this.price,
      }):super(bookDate: bookDate,docName: docName,docAddress: docAddress,docImage: docImage,bookHour: bookHour,docSpciality: docSpciality,bookingStatus: bookingStatus,docId: docId,bookId: bookId,paymentStatus: paymentStatus,price: price);

  factory MybookingModel.fromjson(dynamic jsonData) {
    String stringValue(dynamic value) {
      if (value == null) {
        return '';
      }
      final text = value.toString().trim();
      return text == 'null' ? '' : text;
    }
    double? doubleValue(dynamic value) {
      if (value is num) {
        return value.toDouble();
      }
      if (value is String) {
        return double.tryParse(value.trim());
      }
      return null;
    }

    var status=jsonData['status'];
    final paymentStatus = jsonData['payment_status'] ?? jsonData['paymentStatus'];
    final doctor = jsonData['doctor'] is Map ? jsonData['doctor'] as Map : null;
    final specialtyValue = doctor?['specialty'] ?? doctor?['speciality'];
    final specialtyName = specialtyValue is Map
        ? stringValue(specialtyValue['name'])
        : stringValue(specialtyValue);
    final docImageValue =
        stringValue(doctor?['image'] ?? doctor?['profile_photo']);
    final appointmentDate =
        stringValue(jsonData['appointment_date'] ?? jsonData['date']);
    final appointmentTime =
        stringValue(jsonData['appointment_time'] ?? jsonData['time']);
    final address =
        stringValue(doctor?['address'] ?? doctor?['clinic_address']);
    final priceValue = jsonData['price'] ?? doctor?['session_price'];
    final price = doubleValue(priceValue);

    return MybookingModel(
       bookId: jsonData['id'],
     docId: doctor?['id'] ?? 0,
        docName: stringValue(doctor?['name']).isEmpty
            ? 'Doctor'
            : stringValue(doctor?['name']),
        docSpciality: specialtyName.isEmpty ? 'Specialty' : specialtyName,
        docAddress: address,
        docImage: docImageValue.isEmpty ? null : docImageValue,
        bookingStatus: getStatus(status),
        paymentStatus: getPaymentStatus(paymentStatus),
        bookDate: appointmentDate.isEmpty
            ? stringValue(jsonData['created_at'])
            : appointmentDate,
        bookHour: appointmentTime,
        price: price,
        
        );
  }
  
static  BookingEnum getStatus(dynamic status) {
   final normalized = status?.toString().toLowerCase() ?? '';
   if (normalized == 'canceled') {
     return BookingEnum.cancelled;
   }
   return BookingEnum.values.firstWhere(
      (e) => e.name.toLowerCase() == normalized,
      orElse: () => BookingEnum.pending,
    );

}

static PaymentStatus getPaymentStatus(dynamic status) {
  final normalized = status?.toString().toLowerCase() ?? '';
  if (normalized == 'unpaid' ||
      normalized == 'pending' ||
      normalized == 'failed' ||
      normalized == 'canceled' ||
      normalized == 'cancelled') {
    return PaymentStatus.unpaid;
  }
  if (normalized == 'paid' || normalized == 'completed') {
    return PaymentStatus.paid;
  }
  return PaymentStatus.unknown;
}
}
