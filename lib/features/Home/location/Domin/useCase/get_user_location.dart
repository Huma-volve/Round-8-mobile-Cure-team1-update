import '../entities/user_location.dart';
import '../repositories/location_repository.dart';

class GetUserLocation {
  final LocationRepository repo;

  GetUserLocation({required this.repo});

  Future<UserLocation> call() {
    return repo.getUserLocation();
  }
}

class GetUserAddress {
  final LocationRepository repo;
  GetUserAddress({required this.repo});

  Future<UserAddress> call({
    required double lat,
    required double lng,
  }) async {
    return await repo.getUserAddress(lat: lat, lng: lng);
  }
}
