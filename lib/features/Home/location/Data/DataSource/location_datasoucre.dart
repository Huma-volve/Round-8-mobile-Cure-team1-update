import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationDataSource {
  Future<Position> getCurrentLocation() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw const LocationServiceDisabledException();
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw Exception('Location permission denied');
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission permanently denied');
    }

    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );}

  Future<Placemark> buildAddress(double lat, double lng) async {
    final List<Placemark> placeMarks =
    await placemarkFromCoordinates(lat, lng);
    return placeMarks.first;
  }
}
