import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/features/auth/otp/data/model/otp_model.dart';
import 'package:dartz/dartz.dart';

abstract class OtpRepo {
  Future<Either<Failuer, OtpModel>> otpUser({
    required String otpNum,
    required String phoneNum,
  });
}
