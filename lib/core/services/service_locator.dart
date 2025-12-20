import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/network/apiInterceptor%20.dart';
import 'package:cure_team_1_update/features/chat/data/chatrepoimplment/repoimpement.dart';
import 'package:cure_team_1_update/features/chat/data/datasource/remotdata/remotdata.dart';
import 'package:cure_team_1_update/features/chat/domain/repo/chatrepo.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/cubit/chat_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var getit = GetIt.instance;
Future<void> setup() async {
  //Hive

  //....Hive
  //object from dio
  //pass heder to dio object
  getit.registerSingleton<Dio>(Dio());
  //object from ApiServices
  getit.registerSingleton<ApiServices>(
      ApiServices(getit.get<Dio>()..interceptors.add(ApiInterceptor())));
  getit.registerSingleton<Repoimplement>(
      Repoimplement(immplementRemotdata(getit.get<ApiServices>())));
  getit.registerSingleton<ChatCubit>(ChatCubit(getit.get<Repoimplement>()));
}
