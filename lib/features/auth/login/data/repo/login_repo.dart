import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/features/auth/sign_up/data/model/signup_model.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepo {
  Future<Either<Failuer, SignupModel>> loginUSer({
    required String phoneNumber,
    required String password,
  });
}
