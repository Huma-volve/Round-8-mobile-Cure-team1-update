
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


class LocationDataSource {
  Future<Position> getCurrentLocation() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      throw  const LocationServiceDisabledException();
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      // throw LocationPermissionDeniedException();
    }

    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("Position fetched: ${position.latitude}, ${position.longitude}"); // هنا كمان نتاكد
    return position;
  }

  Future<Placemark> buildAddress (double lat, double lng ) async{
    List placeMarks = await placemarkFromCoordinates(lat,lng);
    final place =placeMarks.first;
    final street = place.street ?? "";
    final area = place.subLocality ?? "";
    final city = place.locality ?? "";
    print(street);
    print(place);
    print(city);

    return place;
  }
}
