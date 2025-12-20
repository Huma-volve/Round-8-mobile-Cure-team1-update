import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'features/Home/location/Data/DataSource/location_datasoucre.dart';
import 'features/Home/location/Data/repo/location_repository_impl.dart';
import 'features/Home/location/Domin/useCase/get_user_location.dart';
import 'features/Home/location/presentation/cubit/location_cubit.dart';


void main() {
  final locationDataSource = LocationDataSource();

  final locationRepository = LocationRepositoryImpl(locationDataSource);

  final getUserLocation = GetUserLocation(repo: locationRepository);
  final getUserAddress = GetUserAddress(repo: locationRepository);

  runApp( DevicePreview(builder: (context) =>  MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => LocationCubit(getUserLocation ,getUserAddress)),
    ],
    child: const MyApp())));
}
