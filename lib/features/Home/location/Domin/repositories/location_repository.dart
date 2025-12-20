
import '../entities/user_location.dart';

abstract class LocationRepository {
  Future <UserLocation> getUserLocation();
  Future<UserAddress> getUserAddress({
    required double lat,
    required double lng,
  });
}