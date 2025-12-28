import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class CreateBookRepo {
  Future<Either<Failuer, int>> createBook(
      {required int doctorId,
      required String appointmentDate,
      required String appointmentTime});
}
