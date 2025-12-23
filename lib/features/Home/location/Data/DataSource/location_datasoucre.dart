import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationDataSource {
  static bool _localeInitialized = false;

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

    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(
        "Position fetched: ${position.latitude}, ${position.longitude}"); // هنا كمان نتاكد
    return position;
  }

  Future<Placemark> buildAddress(double lat, double lng) async {
    if (!_localeInitialized) {
      await setLocaleIdentifier('en');
      _localeInitialized = true;
    }

    final placeMarks = await placemarkFromCoordinates(lat, lng);
    final place = placeMarks.first;
    return place;
  }
}
