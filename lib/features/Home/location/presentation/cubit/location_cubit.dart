import 'package:bloc/bloc.dart';
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
      print("Before getUserLocation");
      final location = await getUserLocation();
      print("Location fetched: $location");
      final address = await getUserAddress(lat: location.lat, lng: location.lng);
      emit(LocationAddressLoaded(address: address, location: location));


      print("Address fetched: $address");

    } catch (e) {
      emit(LocationError("Failed to load location or address"));
    }
  }
}
