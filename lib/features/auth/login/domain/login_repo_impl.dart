import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/auth/login/data/model/login_model.dart';
import 'package:cure_team_1_update/features/auth/login/data/repo/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiServices apiServices;

  LoginRepoImpl(this.apiServices);
  @override
  Future<Either<Failuer, LoginModel>> loginUSer({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      var data = await apiServices.post(
        'auth/login',
        {'phone': phoneNumber, 'password': password},
      );
      return right(LoginModel.fromJson(data));
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
