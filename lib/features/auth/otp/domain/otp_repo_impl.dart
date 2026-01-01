import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
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
      var data = await getIt.get<ApiServices>().post(
        'auth/verify-otp',
        {"phone": phoneNum, "otp": otpNum},
      );
      return right(OtpModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        print('DioException: ${e.toString()}');
        print('DioException response data: ${e.response?.data}');
        return left(Serverfailuer.forDioExcption(e));
      }
      print('Generic Exception: ${e.toString()}');
      return left(Serverfailuer(e.toString()));
    }
  }
}
