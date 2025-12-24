import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/network/apiInterceptor%20.dart';
import 'package:cure_team_1_update/features/Home/Doctor/Data/remoteData/doctor_remote_source_data.dart';
import 'package:cure_team_1_update/features/Home/location/Data/repo/location_repository_impl.dart';
import 'package:cure_team_1_update/features/Home/location/Domin/repositories/location_repository.dart';
import 'package:cure_team_1_update/features/chat/data/chatrepoimplment/repoimpement.dart';
import 'package:cure_team_1_update/features/chat/data/datasource/remotdata/remotdata.dart';
import 'package:cure_team_1_update/features/chat/domain/repo/chatrepo.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/cubit/chat_cubit.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/change_password_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/delete_account/delete_account_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/faqs/faqs_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/logout/logout_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/repos/change_password_repo.dart';
import 'package:cure_team_1_update/features/settings/data/repos/delete_account/delete_accuont_repo.dart';
import 'package:cure_team_1_update/features/settings/data/repos/faqs/faqs_repo.dart';
import 'package:cure_team_1_update/features/settings/data/repos/logout/logout_repo.dart';
import 'package:cure_team_1_update/features/settings/presentation/view_model/bloc/change_password_bloc.dart';
import 'package:cure_team_1_update/features/settings/presentation/view_model/delete_account/delete_account_bloc.dart';
import 'package:cure_team_1_update/features/settings/presentation/view_model/faqs_bloc/faqs_bloc.dart';
import 'package:cure_team_1_update/features/settings/presentation/view_model/logout/logout_bloc.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/Home/Doctor/Data/remoteData/repoImpl.dart';
import '../../features/Home/Doctor/Domain/Repository/doctor_repo.dart';
import '../../features/Home/Doctor/Domain/Usecase/doctor_usecase.dart';
import '../../features/Home/Doctor/Presentation/cubit/doctor_cubit.dart';
import '../../features/Home/Doctor/Presentation/cubit/specailty_cubit.dart';
import '../../features/Home/location/Data/DataSource/location_datasoucre.dart';
import '../../features/Home/location/Domin/useCase/get_user_location.dart';
import '../../features/Home/location/presentation/cubit/location_cubit.dart';

import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

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
  //FAQS
  getit
    ..registerFactory(() => FaqsBloc(getit()))
    ..registerLazySingleton(() => FaqsRepo(getit()))
    ..registerLazySingleton(() => FaqsDataSource(getit()));
  //Delete Account
  getit
    ..registerFactory(() => DeleteAccountBloc(getit()))
    ..registerLazySingleton(() => DeleteAccuontRepo(getit()))
    ..registerLazySingleton(() => DeleteAccounteDataSource(getit()));
  //Logout
  getit
    ..registerFactory(() => LogoutBloc(getit()))
    ..registerLazySingleton(() => LogoutRepo(getit()))
    ..registerLazySingleton(() => LogoutDataSource(getit()));
}
