// import 'package:cure_team_1_update/core/error/failures.dart';
// import 'package:cure_team_1_update/core/services/api_services.dart';
// import 'package:cure_team_1_update/features/auth/login/data/repo/login_repo.dart';
// import 'package:cure_team_1_update/features/auth/sign_up/data/model/signup_model.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// class LoginRepoImpl implements LoginRepo {
//   final ApiServices apiServices;

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
