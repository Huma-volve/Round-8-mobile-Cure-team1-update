import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/features/doctor_details/data/data_source/create_book_remote_data_source.dart';
import 'package:cure_team_1_update/features/doctor_details/domain/repo/create_book_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CreateBookRepoImp extends CreateBookRepo {
  CreateBookRemoteDataSource createBookRemoteDataSource;
  CreateBookRepoImp({required this.createBookRemoteDataSource});
  @override
  Future<Either<Failuer, void>> createBook({required int doctorId,required String appointmentDate,required String appointmentTime})async {

    try{
  await createBookRemoteDataSource.createBook(doctorId: doctorId, appointmentDate: appointmentDate, appointmentTime: appointmentTime);
  return right(null);
    }catch (error)
    {
if (error is DioException)
{
  return left(Serverfailuer.forDioExcption(error));
}else{
  return left( Serverfailuer(error.toString()));
}
    }

  }
}