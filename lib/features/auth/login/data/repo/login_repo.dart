import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/features/auth/login/data/model/login_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failuer, LoginModel>> loginUSer({
    required String phoneNumber,
    required String password,
  });
}
