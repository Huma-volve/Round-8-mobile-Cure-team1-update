import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/Booking/data/remote_data_source/booking_remote_data_source.dart';
import 'package:cure_team_1_update/features/Booking/data/remote_data_source/booking_remote_data_source_impl.dart';
import 'package:cure_team_1_update/features/Booking/data/repo/my_book_repo_implement.dart';
import 'package:cure_team_1_update/features/Booking/domain/repo/my_book_repo.dart';
import 'package:cure_team_1_update/core/services/network/apiInterceptor%20.dart';
import 'package:cure_team_1_update/features/Home/location/Data/repo/location_repository_impl.dart';
import 'package:cure_team_1_update/features/Home/location/Domin/repositories/location_repository.dart';
<<<<<<< HEAD
import 'package:cure_team_1_update/features/chat/data/datasource/remotdata/remotdata.dart';
import 'package:cure_team_1_update/features/doctor_details/data/data_source/create_book_remote_data_source.dart';
import 'package:cure_team_1_update/features/doctor_details/data/data_source/create_book_remote_data_sourceimp.dart';
import 'package:cure_team_1_update/features/doctor_details/data/repo/create_book_repo_imp.dart';
import 'package:cure_team_1_update/features/doctor_details/domain/repo/create_book_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/Home/Doctor/Data/remoteData/repoImpl.dart';
import '../../features/Home/Doctor/Domain/Repository/doctor_repo.dart';
import '../../features/Home/Doctor/Domain/Usecase/doctor_usecase.dart';
import '../../features/Home/Doctor/Presentation/cubit/doctor_cubit.dart';
=======
import 'package:cure_team_1_update/features/auth/login/domain/login_repo_impl.dart';
import 'package:cure_team_1_update/features/auth/login/presentation/manage/login_cubit.dart';
import 'package:cure_team_1_update/features/chat/data/chatrepoimplment/repoimpement.dart';
import 'package:cure_team_1_update/features/chat/data/datasource/remotdata/remotdata.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

>>>>>>> 43e6a4d661d8da2aa9dacd0bba7a98bb4f273ab3
import '../../features/Home/location/Data/DataSource/location_datasoucre.dart';
import '../../features/Home/location/Domin/useCase/get_user_location.dart';
import '../../features/Home/location/presentation/cubit/location_cubit.dart';

<<<<<<< HEAD

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiServices>(ApiServices(getIt.get<Dio>()));
 getIt.registerSingleton<BookingRemoteDataSource>(BookingRemoteDataSourceImpl(dio: getIt<Dio>()));
   getIt.registerSingleton<MyBookRepo>(MyBookRepoImplement(bookingRemoteDataSource: getIt<BookingRemoteDataSource>()));
  // Dio
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(ApiInterceptor());
    return dio;
  });
=======
final getIt = GetIt.instance;

Future<void> setup() async {
  /// Dio
  final dio = Dio();
  dio.interceptors.add(ApiInterceptor());
  getIt.registerSingleton<Dio>(dio);
>>>>>>> 43e6a4d661d8da2aa9dacd0bba7a98bb4f273ab3

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

<<<<<<< HEAD
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

  
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiServices>(ApiServices(getIt.get<Dio>()));
 getIt.registerSingleton<BookingRemoteDataSource>(BookingRemoteDataSourceImpl(dio: getIt<Dio>()));
   getIt.registerSingleton<MyBookRepo>(MyBookRepoImplement(bookingRemoteDataSource: getIt<BookingRemoteDataSource>()));
    getIt.registerSingleton<CreateBookRemoteDataSource>(CreateBookRemoteDataSourceImp());
   getIt.registerSingleton<CreateBookRepo>(CreateBookRepoImp(createBookRemoteDataSource: getIt<CreateBookRemoteDataSource>()));
=======
>>>>>>> 43e6a4d661d8da2aa9dacd0bba7a98bb4f273ab3
}
