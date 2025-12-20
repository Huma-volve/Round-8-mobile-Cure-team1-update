import '../../Domin/entities/user_location.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final UserLocation location;
  LocationLoaded(this.location);
}

class LocationPermissionDenied extends LocationState {}

class LocationServiceDisabled extends LocationState {}

class LocationError extends LocationState {
  final String message ;
  LocationError(this.message);
}

class LocationAddressLoaded extends LocationState {
  final UserAddress address;
  final UserLocation location;

  LocationAddressLoaded( { required this.address, required this.location});
}


