<<<<<<< HEAD
// import 'package:cure_team_1_update/core/error/failures.dart';
// import 'package:cure_team_1_update/core/services/api_services.dart';
// import 'package:cure_team_1_update/features/auth/login/data/repo/login_repo.dart';
// import 'package:cure_team_1_update/features/auth/sign_up/data/model/signup_model.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
=======
import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:cure_team_1_update/features/auth/login/data/repo/login_repo.dart';
import 'package:cure_team_1_update/features/auth/sign_up/data/model/signup_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
>>>>>>> 43e6a4d661d8da2aa9dacd0bba7a98bb4f273ab3

// class LoginRepoImpl implements LoginRepo {
//   final ApiServices apiServices;

<<<<<<< HEAD
//   LoginRepoImpl(this.apiServices);
//   @override
//   Future<Either<Failuer, SignupModel>> loginUSer(
//       {required phoneNumber, required password}) async {
//     try {
//       var data = await apiServices.post(
     
//         {
//           'phoneNumber': phoneNumber, 'password': password
        
//         }, endpoint:   'auth/login', body: {}, headers: {},
//       );
//       return right(SignupModel.fromJson(data));
//     } catch (e) {
//       if (e is DioException) {
//         print('DioException: ${e.toString()}');
//         print('DioException response data: ${e.response?.data}');
//         return left(Serverfailuer.forDioExcption(e));
//       }
//       print('Generic Exception: ${e.toString()}');
//       return left(Serverfailuer(e.toString()));
//     }
//   }
// }
=======
  LoginRepoImpl(this.apiServices);
  @override
  Future<Either<Failuer, SignupModel>> loginUSer(
      {required phoneNumber, required password}) async {
    try {
      var data = await getIt
          .get<ApiServices>()
          .post('auth/login', {"password": password, "phone": phoneNumber});
      print(
          '=================================================================${data['data']['token']}');
      await Cachehelper.cacheToken(data['data']['token']);
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
>>>>>>> 43e6a4d661d8da2aa9dacd0bba7a98bb4f273ab3
