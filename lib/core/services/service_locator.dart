import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/network/apiInterceptor%20.dart';
import 'package:cure_team_1_update/features/Home/Doctor/Data/remoteData/doctor_remote_source_data.dart';
import 'package:cure_team_1_update/features/Home/location/Data/repo/location_repository_impl.dart';
import 'package:cure_team_1_update/features/Home/location/Domin/repositories/location_repository.dart';
import 'package:cure_team_1_update/features/chat/data/chatrepoimplment/repoimpement.dart';
import 'package:cure_team_1_update/features/chat/data/datasource/remotdata/remotdata.dart';
import 'package:cure_team_1_update/features/chat/domain/repo/chatrepo.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/cubit/chat_cubit.dart';
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
  // Dio
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(ApiInterceptor());
    return dio;
  });

  // ApiServices
  getIt.registerLazySingleton<ApiServices>(
        () => ApiServices(getIt<Dio>()),
  );

  // Chat Feature
  getIt.registerLazySingleton<Remotdata>(
        () => immplementRemotdata(getIt<ApiServices>()),
  );

  // Location Feature
  getIt.registerLazySingleton<LocationDataSource>(
        () => LocationDataSource(),
  );

  getIt.registerLazySingleton<LocationRepository>(
        () => LocationRepositoryImpl(getIt<LocationDataSource>()),
  );

  getIt.registerLazySingleton<GetUserLocation>(
        () => GetUserLocation(repo: getIt<LocationRepository>()),
  );

  getIt.registerLazySingleton<GetUserAddress>(
        () => GetUserAddress(repo: getIt<LocationRepository>()),
  );

  getIt.registerLazySingleton<LocationCubit>(
        () => LocationCubit(
      getIt<GetUserLocation>(),
      getIt<GetUserAddress>(),
    ),
  );

  // Doctors Feature
  getIt.registerLazySingleton<DoctorRemoteSourceData>(
        () => DoctorRemoteSourceData(apiServices: getIt<ApiServices>()),
  );

  getIt.registerLazySingleton<DoctorRepo>(
        () => DoctorRepoImpl(remote: getIt<DoctorRemoteSourceData>()),
  );

  getIt.registerLazySingleton<DoctorUsecase>(
        () => DoctorUsecase(repo: getIt<DoctorRepo>()),
  );

  getIt.registerLazySingleton<GetDoctorsBySpecialtyUseCase>(
        () => GetDoctorsBySpecialtyUseCase(repo: getIt<DoctorRepo>()),
  );

  // **تحويل DoctorCubit و DoctorsBySpecialtyCubit إلى singleton**
  getIt.registerLazySingleton<DoctorCubit>(
        () => DoctorCubit(
      doctorUsecase: getIt<DoctorUsecase>(),
      getUserLocation: getIt<GetUserLocation>(),
    ),
  );

 // getIt.registerLazySingleton<DoctorsBySpecialtyCubit>(
 //       () => DoctorsBySpecialtyCubit(),
 // );
}
