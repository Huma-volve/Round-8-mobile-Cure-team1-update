
import '../../Domin/entities/user_location.dart';
import '../../Domin/repositories/location_repository.dart';
import '../DataSource/location_datasoucre.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource dataSource;

  LocationRepositoryImpl(this.dataSource);

  @override
  Future<UserLocation> getUserLocation() async {
    final position = await dataSource.getCurrentLocation();
    return UserLocation(lat: position.latitude, lng: position.longitude);
  }

  @override
  Future<UserAddress> getUserAddress({
    required double lat,
    required double lng,
  }) async {
    try {
      final placemark = await dataSource.buildAddress(lat, lng);
      return UserAddress(
        street: placemark.street ?? '',
        city: placemark.locality ?? '',
        country: placemark.country ?? '',
      );
    } catch (_) {
      return const UserAddress(
        street: 'Unknown',
        city: 'Unknown',
        country: 'Unknown',
      );
    }
  }
}
