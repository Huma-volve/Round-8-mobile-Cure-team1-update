import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var getit = GetIt.instance;
Future<void> setup() async {
  //Hive

  //....Hive
  //object from dio
  getit.registerSingleton<Dio>(Dio());
  //object from ApiServices
  getit.registerSingleton<ApiServices>(ApiServices(getit.get<Dio>()));
}
