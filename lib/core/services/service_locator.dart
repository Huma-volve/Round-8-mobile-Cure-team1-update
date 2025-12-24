import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/network/apiInterceptor%20.dart';
import 'package:cure_team_1_update/features/Home/location/Data/repo/location_repository_impl.dart';
import 'package:cure_team_1_update/features/Home/location/Domin/repositories/location_repository.dart';
import 'package:cure_team_1_update/features/auth/login/domain/login_repo_impl.dart';
import 'package:cure_team_1_update/features/auth/login/presentation/manage/login_cubit.dart';
import 'package:cure_team_1_update/features/chat/data/chatrepoimplment/repoimpement.dart';
import 'package:cure_team_1_update/features/chat/data/datasource/remotdata/remotdata.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/Home/location/Data/DataSource/location_datasoucre.dart';
import '../../features/Home/location/Domin/useCase/get_user_location.dart';
import '../../features/Home/location/presentation/cubit/location_cubit.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  /// Dio
  final dio = Dio();
  dio.interceptors.add(ApiInterceptor());
  getIt.registerSingleton<Dio>(dio);

  /// ApiServices
  getIt.registerSingleton<ApiServices>(
    ApiServices(getIt<Dio>()),
  );

  /// Chat Feature
  getIt.registerSingleton<Remotdata>(
    immplementRemotdata(getIt<ApiServices>()),
  );

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
