import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/app/bloc_observer.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cure_team_1_update/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Cachehelper.init();
  await SharedPref().instantiatePreferences();

  Bloc.observer = AppBlocObserver();
  await setup();
  runApp(const MyApp());
}
