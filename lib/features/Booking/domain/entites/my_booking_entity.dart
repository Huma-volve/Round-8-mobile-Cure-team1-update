import 'package:cure_team_1_update/features/Booking/domain/enums/booking_enum.dart';

class MyBookingEntity {
final int docid;
  final String docName;
  final String docSpciality;
  final String docAddress;
  final String? docImage;
  final BookingEnum bookingStatus;
  final String bookDate;
  final String bookHour;

  MyBookingEntity({ required this.docid,required this.docName, required this.docSpciality, required this.docAddress,  this.docImage, required this.bookingStatus, required this.bookDate, required this.bookHour});

}