//
// register refactor بتتعمل مع البلوك لانه بيستدعى اكتر من مره كل مره بيعمل انستنس جديد

// registerlazy singiltone  دى للحاجه اللى بتستدعى مره واحده بيعمل انستنس وبيستخدم نفس الانستنس كل مره يستدعى فيها ولاكن الانستنس دا مبيتكريتش غير لما  يستدعى

// singilton دا بيعمل انستنس علطول اول ماالابيليكيشن يفتح او على حسب هوا فين وبيفضل يستخدم الانستنس دا


import 'package:cure_team_1_update/core/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:cure_team_1_update/core/app/upload_image/data_source/upload_image_data_source.dart';
import 'package:cure_team_1_update/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initCore();
  // await _initAuth();
}

Future<void> _initCore() async {
  // final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();

  sl
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
    // ImageCubit
    ..registerFactory(() => UploadImageCubit(sl()))
    ..registerLazySingleton(() => UploadImageRepo(sl()))
    ..registerLazySingleton(() => const UploadImageDataSource());
}
