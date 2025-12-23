import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/network/apiInterceptor%20.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chat_cubit/chat_cubit.dart';
import 'package:cure_team_1_update/features/profile/data/data_source/profile_data_source.dart';
import 'package:cure_team_1_update/features/profile/data/repos/edit_profile_repo.dart';
import 'package:cure_team_1_update/features/profile/presentation/bloc/bloc/edit_profile_bloc.dart';
import 'package:cure_team_1_update/features/chat/data/chatrepoimplment/repoimpement.dart';
import 'package:cure_team_1_update/features/chat/data/datasource/remotdata/remotdata.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/change_password_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/repos/change_password_repo.dart';
import 'package:cure_team_1_update/features/settings/presentation/bloc/bloc/change_password_bloc.dart';

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

  //edit profile
  getit
    ..registerFactory(() => EditProfileBloc(getit()))
    ..registerLazySingleton(() => EditProfileRepo(getit()))
    ..registerLazySingleton(() => EditProfileDataSource(getit()));
  //Password change
  getit
    ..registerFactory(() => ChangePasswordBloc(getit()))
    ..registerLazySingleton(() => ChangePasswordRepo(getit()))
    ..registerLazySingleton(() => ChangePasswordDataSource(getit()));
}
