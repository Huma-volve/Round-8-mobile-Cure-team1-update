import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/features/Booking/data/remote_data_source/booking_remote_data_source.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/Booking/domain/repo/my_book_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MyBookRepoImplement extends MyBookRepo {
  BookingRemoteDataSource bookingRemoteDataSource;
  MyBookRepoImplement({required this.bookingRemoteDataSource});
  @override
  Future<Either<Failuer, List<MyBookingEntity>>> getMyBooking() async {
    try {
      List<MyBookingEntity> allBooks =
          await bookingRemoteDataSource.getBookingData();
      return right(allBooks);
    } catch (error) {
      if (error is DioException) {
        return left(Serverfailuer.forDioExcption(error));
      }

      return left(Serverfailuer(error.toString()));
    }
  }
  
  @override
  Future<Either<Failuer, void>> cancelMyBooking({required int bookId,required String body})async {
   try{
await bookingRemoteDataSource.cancelMyBooking(bookId: bookId, body: body);
return right(null);
   }catch (error)
   {
    if (error is DioException) {
        return left(Serverfailuer.forDioExcption(error));
      }

      return left(Serverfailuer(error.toString()));
     
   }
  }
}
