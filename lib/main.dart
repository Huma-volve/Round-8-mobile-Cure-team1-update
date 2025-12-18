import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:cure_team_1_update/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cachehelper.init();
  runApp(DevicePreview(builder: (context) => const MyApp()));
}
