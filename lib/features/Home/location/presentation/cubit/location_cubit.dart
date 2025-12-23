import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/features/Home/location/Domin/entities/user_location.dart';
import '../../Domin/useCase/get_user_location.dart';
import '../state/location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final GetUserLocation getUserLocation;
  final GetUserAddress getUserAddress;

  LocationCubit(
      this.getUserLocation,
      this.getUserAddress,
      ) : super(LocationInitial());

  Future<void> fetchLocationAndAddress() async {
    emit(LocationLoading());

    try {
      final location = await getUserLocation();

      final address = await getUserAddress(
        lat: location.lat,
        lng: location.lng,
      );

      emit(
        LocationAddressLoaded(
          address: address,
          location: location,
        ),
      );
    } catch (e) {
      final message = e.toString().replaceFirst('Exception: ', '');
      emit(LocationError(message.isEmpty
          ? "Failed to load location or address"
          : message));
    }
  }

  void setLocationAndAddress({
    required UserLocation location,
    required UserAddress address,
  }) {
    emit(LocationAddressLoaded(address: address, location: location));
  }
}
