import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/Booking/data/remote_data_source/booking_remote_data_source.dart';
import 'package:cure_team_1_update/features/Booking/data/repo/my_book_repo_implement.dart';
import 'package:cure_team_1_update/features/Booking/domain/repo/my_book_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

var getit = GetIt.instance;
Future<void> setup() async {
  getit.registerSingleton<Dio>(Dio());
  getit.registerSingleton<ApiServices>(ApiServices(getit.get<Dio>()));
 getit.registerSingleton<BookingRemoteDataSource>(BookingRemoteDataSourceImpl(dio: getit<Dio>()));
   getit.registerSingleton<MyBookRepo>(MyBookRepoImplement(bookingRemoteDataSource: getit<BookingRemoteDataSource>()));
}
