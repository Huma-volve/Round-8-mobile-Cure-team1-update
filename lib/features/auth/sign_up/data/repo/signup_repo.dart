import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/features/auth/sign_up/data/model/signup_model.dart';
import 'package:dartz/dartz.dart';

abstract class SignupRepo {
  Future<Either<Failuer, SignupModel>> signupUser({
    required String fullName,
    required String phoneNumber,
    required String email,
    required String password,
    required String passwordConfirm,
  });
}
