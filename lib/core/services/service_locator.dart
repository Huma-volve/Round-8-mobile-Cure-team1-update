import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/constants/app_constants.dart';
import 'package:cure_team_1_update/core/services/network/apiInterceptor%20.dart';
import 'package:cure_team_1_update/features/Home/location/Data/repo/location_repository_impl.dart';
import 'package:cure_team_1_update/features/Home/location/Domin/repositories/location_repository.dart';
import 'package:cure_team_1_update/features/chat/data/chatrepoimplment/repoimpement.dart';
import 'package:cure_team_1_update/features/chat/data/datasource/remotdata/remotdata.dart';
import 'package:cure_team_1_update/features/chat/domain/repo/chatrepo.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chat_cubit/chat_cubit.dart';
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

import '../../features/Home/location/Data/DataSource/location_datasoucre.dart';
import '../../features/Home/location/Domin/useCase/get_user_location.dart';
import '../../features/Home/location/presentation/cubit/location_cubit.dart';

final getIt = GetIt.instance;

var getit = GetIt.instance;
Future<void> setup() async {
  //Hive

  //....Hive
  //object from dio
  //pass heder to dio object
  getit.registerSingleton<Dio>(
    Dio(BaseOptions(baseUrl: AppConstants.baseUrl)),
  );
  //object from ApiServices
  getit.registerSingleton<ApiServices>(
      ApiServices(getit.get<Dio>()..interceptors.add(ApiInterceptor())));
  getit.registerSingleton<Repoimplement>(
      Repoimplement(immplementRemotdata(getit.get<ApiServices>())));
  getit.registerSingleton<ChatCubit>(ChatCubit(getit.get<Repoimplement>()));

  /// Location Feature
  getIt.registerSingleton<LocationDataSource>(
    LocationDataSource(),
  );

  getIt.registerSingleton<LocationRepository>(
    LocationRepositoryImpl(getIt<LocationDataSource>()),
  );

  getIt.registerSingleton<GetUserLocation>(
    GetUserLocation(repo: getIt<LocationRepository>()),
  );

  getIt.registerSingleton<GetUserAddress>(
    GetUserAddress(repo: getIt<LocationRepository>()),
  );

  getIt.registerSingleton<LocationCubit>(
    LocationCubit(
      getIt<GetUserLocation>(),
      getIt<GetUserAddress>(),
    ),
  );

}
