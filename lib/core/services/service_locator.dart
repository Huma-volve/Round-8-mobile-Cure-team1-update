import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/Booking/data/remote_data_source/booking_remote_data_source.dart';
import 'package:cure_team_1_update/features/Booking/data/remote_data_source/booking_remote_data_source_impl.dart';
import 'package:cure_team_1_update/features/Booking/data/repo/my_book_repo_implement.dart';
import 'package:cure_team_1_update/features/Booking/domain/repo/my_book_repo.dart';
// import 'package:cure_team_1_update/core/services/network/apiInterceptor%20.dart';
import 'package:cure_team_1_update/features/Home/location/Data/repo/location_repository_impl.dart';
import 'package:cure_team_1_update/features/Home/location/Domin/repositories/location_repository.dart';
import 'package:cure_team_1_update/features/chat/data/datasource/remotdata/remotdata.dart';
import 'package:cure_team_1_update/features/doctor_details/data/data_source/create_book_remote_data_source.dart';
import 'package:cure_team_1_update/features/doctor_details/data/data_source/create_book_remote_data_sourceimp.dart';
import 'package:cure_team_1_update/features/doctor_details/data/repo/create_book_repo_imp.dart';
import 'package:cure_team_1_update/features/doctor_details/domain/repo/create_book_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/Home/location/Data/DataSource/location_datasoucre.dart';
import '../../features/Home/location/Domin/useCase/get_user_location.dart';
import '../../features/Home/location/presentation/cubit/location_cubit.dart';


final getIt = GetIt.instance;

Future<void> setup() async {

  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiServices>(ApiServices(getIt.get<Dio>()));
 getIt.registerSingleton<BookingRemoteDataSource>(BookingRemoteDataSourceImpl(dio: getIt<Dio>()));
   getIt.registerSingleton<MyBookRepo>(MyBookRepoImplement(bookingRemoteDataSource: getIt<BookingRemoteDataSource>()));
  // Dio
  // getIt.registerLazySingleton<Dio>(() {
  //   final dio = Dio();
  //   dio.interceptors.add(ApiInterceptor());
  //   return dio;
  // });

  // ApiServices
  // getIt.registerLazySingleton<ApiServices>(
  //   () => ApiServices(getIt<Dio>()),
  // );

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

  

  
  // getIt.registerSingleton<Dio>(Dio());
  // getIt.registerSingleton<ApiServices>(ApiServices(getIt.get<Dio>()));
//  getIt.registerSingleton<BookingRemoteDataSource>(BookingRemoteDataSourceImpl(dio: getIt<Dio>()));
  //  getIt.registerSingleton<MyBookRepo>(MyBookRepoImplement(bookingRemoteDataSource: getIt<BookingRemoteDataSource>()));
    getIt.registerSingleton<CreateBookRemoteDataSource>(CreateBookRemoteDataSourceImp());
   getIt.registerSingleton<CreateBookRepo>(CreateBookRepoImp(createBookRemoteDataSource: getIt<CreateBookRemoteDataSource>()));
}
