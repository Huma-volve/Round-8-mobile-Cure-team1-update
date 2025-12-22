



import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/Booking/domain/enums/booking_enum.dart';

class MybookingModel extends MyBookingEntity {
 final int docid;
  final String docName;
  final String docSpciality;
  final String docAddress;
  final String? docImage;
  final BookingEnum bookingStatus;
  final String bookDate;
  final String bookHour;

  MybookingModel(
      {
      required this.docName,
      required this.docid,
      required this.docSpciality,
      required this.docAddress,
       this.docImage,
      required this.bookingStatus,
      required this.bookDate,
      required this.bookHour}):super(bookDate: bookDate,docName: docName,docAddress: docAddress,docImage: docImage,bookHour: bookHour,docSpciality: docSpciality,bookingStatus: bookingStatus,docid: docid);

  factory MybookingModel.fromjson(dynamic jsonData) {
    
    return MybookingModel(
      
     docid: jsonData['doctor']['id'],
        docName: jsonData['doctor']['name'],
        docSpciality:jsonData['doctor']['speciality'],
        docAddress:jsonData['doctor']['address'] ,
        docImage: jsonData['doctor']['image'] ,
        bookingStatus: BookingEnum.upcoming,
        bookDate: jsonData['created_at'],
        bookHour: jsonData['appointment_time']
        
        );
  }
}
