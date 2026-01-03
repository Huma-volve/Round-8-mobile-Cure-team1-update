import 'dart:math' as math;

import '../../features/Home/Data/models/doctor_api_model.dart';
import '../../features/Home/location/Domin/entities/user_location.dart';

const double _earthRadiusKm = 6371;
const double _maxNearbyDistanceKm = 50;


List<ApiDoctor> _nearbyDoctors(
    UserLocation location,
    List<ApiDoctor> doctors,
    ) {
  final doctorsWithDistance = doctors.map((doctor) {
    final lat = doctor.latitude;
    final lng = doctor.longitude;
    final distance = lat != null && lng != null
        ? _distanceKm(
      location.lat,
      location.lng,
      lat,
      lng,
    )
        : double.infinity;
    return (doctor: doctor, distance: distance);
  }).toList();

  doctorsWithDistance.sort((a, b) => a.distance.compareTo(b.distance));

  final nearby = doctorsWithDistance
      .where((entry) => entry.distance <= _maxNearbyDistanceKm)
      .map((entry) => entry.doctor)
      .toList();

  if (nearby.isEmpty) {
    return doctorsWithDistance.map((entry) => entry.doctor).toList();
  }

  return nearby;
}

double _distanceKm(double lat1, double lng1, double lat2, double lng2) {
  final dLat = _degreesToRadians(lat2 - lat1);
  final dLng = _degreesToRadians(lng2 - lng1);
  final a = math.pow(math.sin(dLat / 2), 2) +
      math.cos(_degreesToRadians(lat1)) *
          math.cos(_degreesToRadians(lat2)) *
          math.pow(math.sin(dLng / 2), 2);
  final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  return _earthRadiusKm * c;
}

double _degreesToRadians(double degrees) {
  return degrees * (math.pi / 180);
}