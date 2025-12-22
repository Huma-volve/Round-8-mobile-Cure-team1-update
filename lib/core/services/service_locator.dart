import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/network/apiInterceptor%20.dart';
import 'package:cure_team_1_update/features/profile/data/data_source/profile_data_source.dart';
import 'package:cure_team_1_update/features/profile/data/repos/edit_profile_repo.dart';
import 'package:cure_team_1_update/features/profile/presentation/bloc/bloc/edit_profile_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var getit = GetIt.instance;
Future<void> setup() async {
  //Hive

  //....Hive
  //object from dio
  //pass heder to dio object
  getit.registerSingleton<Dio>(Dio()..interceptors.add(ApiInterceptor()));
  //object from ApiServices
  getit.registerSingleton<ApiServices>(ApiServices(getit.get<Dio>()));

  //edit profile
  getit
    ..registerFactory(() => EditProfileBloc(getit()))
    ..registerLazySingleton(() => EditProfileRepo(getit()))
    ..registerLazySingleton(() => EditProfileDataSource(getit()));
}
