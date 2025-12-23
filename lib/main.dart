import 'package:cure_team_1_update/core/app/bloc_observer.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:cure_team_1_update/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cachehelper.init();
  Bloc.observer = AppBlocObserver();
  await setup();

  runApp(DevicePreview(builder: (context) => const MyApp()));
}
