import 'package:cure_team_1_update/features/Booking/domain/enums/booking_enum.dart';
import 'package:cure_team_1_update/features/Booking/domain/enums/payment_status_enum.dart';

class MyBookingEntity {
final int docId;
final int bookId;
  final String docName;
  final String docSpciality;
  final String docAddress;
  final String? docImage;
  final BookingEnum bookingStatus;
  final PaymentStatus paymentStatus;
  final String bookDate;
  final String bookHour;
  final double? price;

  MyBookingEntity({
    required this.bookId,
    required this.docId,
    required this.docName,
    required this.docSpciality,
    required this.docAddress,
    this.docImage,
    required this.bookingStatus,
    required this.paymentStatus,
    required this.bookDate,
    required this.bookHour,
    this.price,
  });

}
