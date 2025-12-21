import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/auth/sign_up/data/model/signup_model.dart';
import 'package:cure_team_1_update/features/auth/sign_up/data/repo/signup_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class RegisterRepoImpl implements SignupRepo {
  final ApiServices apiServices;

  RegisterRepoImpl(this.apiServices);
  @override
  Future<Either<Failuer, SignupModel>> signupUser({
    required String fullName,
    required String phoneNumber,
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    try {
      var data = await apiServices.post(
        'auth/register',
        {
          'name': fullName,
          'phone': phoneNumber,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirm,
        },
      );
      return right(SignupModel.fromJson(data));
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
