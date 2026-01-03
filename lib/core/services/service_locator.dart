import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/network/apiInterceptor%20.dart';
import 'package:cure_team_1_update/features/Booking/data/remote_data_source/booking_remote_data_source.dart';
import 'package:cure_team_1_update/features/Booking/data/remote_data_source/booking_remote_data_source_impl.dart';
import 'package:cure_team_1_update/features/Booking/data/repo/my_book_repo_implement.dart';
import 'package:cure_team_1_update/features/Booking/domain/repo/my_book_repo.dart';

import 'package:cure_team_1_update/features/Home/location/Data/repo/location_repository_impl.dart';
import 'package:cure_team_1_update/features/Home/location/Domin/repositories/location_repository.dart';
import 'package:cure_team_1_update/features/chat/data/datasource/remotdata/remotdata.dart';
import 'package:cure_team_1_update/features/doctor_details/data/data_source/create_book_remote_data_source.dart';
import 'package:cure_team_1_update/features/doctor_details/data/data_source/create_book_remote_data_sourceimp.dart';
import 'package:cure_team_1_update/features/doctor_details/data/repo/create_book_repo_imp.dart';
import 'package:cure_team_1_update/features/doctor_details/domain/repo/create_book_repo.dart';
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
import 'package:cure_team_1_update/features/auth/login/domain/login_repo_impl.dart';
import 'package:cure_team_1_update/features/auth/login/presentation/manage/login_cubit.dart';
import 'package:cure_team_1_update/features/auth/otp/data/repo/otp_repo.dart';
import 'package:cure_team_1_update/features/auth/otp/domain/otp_repo_impl.dart';
import 'package:cure_team_1_update/features/auth/otp/presentation/manage/otp_cubit.dart';
import 'package:cure_team_1_update/features/chat/data/chatrepoimplment/repoimpement.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chat_cubit/chat_cubit.dart';
import 'package:cure_team_1_update/features/profile/data/data_source/profile_data_source.dart';
import 'package:cure_team_1_update/features/profile/data/repos/edit_profile_repo.dart';
import 'package:cure_team_1_update/features/profile/presentation/bloc/bloc/edit_profile_bloc.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/faqs/faqs_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/repos/faqs/faqs_repo.dart';
import 'package:cure_team_1_update/features/settings/presentation/view_model/faqs_bloc/faqs_bloc.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/logout/logout_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/repos/logout/logout_repo.dart';
import 'package:cure_team_1_update/features/settings/presentation/view_model/logout/logout_bloc.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/change_password_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/repos/change_password_repo.dart';
import 'package:cure_team_1_update/features/settings/presentation/view_model/bloc/change_password_bloc.dart';
import 'package:cure_team_1_update/features/settings/data/data_source/delete_account/delete_account_data_source.dart';
import 'package:cure_team_1_update/features/settings/data/repos/delete_account/delete_accuont_repo.dart';
import 'package:cure_team_1_update/features/settings/presentation/view_model/delete_account/delete_account_bloc.dart';

import '../../features/Home/location/Data/DataSource/location_datasoucre.dart';
import '../../features/Home/location/Domin/useCase/get_user_location.dart';
import '../../features/Home/location/presentation/cubit/location_cubit.dart';

final getIt = GetIt.instance;

var getit = GetIt.instance;
Future<void> setup() async {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<BookingRemoteDataSource>(
      BookingRemoteDataSourceImpl(dio: getIt<Dio>()));
  getIt.registerSingleton<MyBookRepo>(MyBookRepoImplement(
      bookingRemoteDataSource: getIt<BookingRemoteDataSource>()));
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

  //object from ApiServices
  getIt.registerSingleton<ApiServices>(
      ApiServices(getIt.get<Dio>()..interceptors.add(ApiInterceptor())));
  getIt.registerSingleton<Repoimplement>(
      Repoimplement(immplementRemotdata(getIt.get<ApiServices>()) as Remotdata));
  getIt.registerSingleton<ChatCubit>(ChatCubit(getIt.get<Repoimplement>()));
  getIt.registerSingleton<LoginRepoImpl>(
      LoginRepoImpl(getIt.get<ApiServices>()));

  getIt.registerSingleton<LoginCubit>(
      LoginCubit(loginRepo: getIt.get<LoginRepoImpl>()));

  getIt.registerSingleton<OtpRepo>(OtpRepoImpl(getIt.get<ApiServices>()));
  getIt
      .registerFactory<OtpCubit>(() => OtpCubit(otpRepo: getIt.get<OtpRepo>()));

  getIt.registerSingleton<LoginCubit>(
      LoginCubit(loginRepo: getIt.get<LoginRepoImpl>()));

  // getIt.registerSingleton<OtpRepo>(OtpRepoImpl(getIt.get<ApiServices>()));
  // getIt
  //     .registerFactory<OtpCubit>(() => OtpCubit(otpRepo: getIt.get<OtpRepo>()));

  //edit profile
  getIt
    ..registerFactory(() => EditProfileBloc(getIt()))
    ..registerLazySingleton(() => EditProfileRepo(getIt()))
    ..registerLazySingleton(() => EditProfileDataSource(getIt()));
  //Password change
  getIt
    ..registerFactory(() => ChangePasswordBloc(getIt()))
    ..registerLazySingleton(() => ChangePasswordRepo(getIt()))
    ..registerLazySingleton(() => ChangePasswordDataSource(getIt()));
  //FAQS
  getIt
    ..registerFactory(() => FaqsBloc(getIt()))
    ..registerLazySingleton(() => FaqsRepo(getIt()))
    ..registerLazySingleton(() => FaqsDataSource(getIt()));
  //Delete Account
  getIt
    ..registerFactory(() => DeleteAccountBloc(getIt()))
    ..registerLazySingleton(() => DeleteAccuontRepo(getIt()))
    ..registerLazySingleton(() => DeleteAccounteDataSource(getIt()));
  //Logout
  getIt
    ..registerFactory(() => LogoutBloc(getIt()))
    ..registerLazySingleton(() => LogoutRepo(getIt()))
    ..registerLazySingleton(() => LogoutDataSource(getIt()));
}
