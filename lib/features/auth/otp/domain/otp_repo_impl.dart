import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/auth/otp/data/model/otp_model.dart';
import 'package:cure_team_1_update/features/auth/otp/data/repo/otp_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class OtpRepoImpl implements OtpRepo {
  final ApiServices apiServices;

  OtpRepoImpl(this.apiServices);
  @override
  Future<Either<Failuer, OtpModel>> otpUser({
    required String otpNum,
    required String phoneNum,
  }) async {
    try {
      final data = await apiServices.post(
        'auth/verify-otp',
        {"phone": phoneNum, "otp": otpNum},
      );
      return right(OtpModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailuer.forDioExcption(e));
      }
      return left(Serverfailuer(e.toString()));
    }
  }
}
