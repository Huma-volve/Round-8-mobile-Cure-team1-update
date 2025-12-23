import 'package:cure_team_1_update/features/Home/Doctor/Data/model/doctor_model.dart';
import 'package:cure_team_1_update/features/Home/Doctor/Domain/Repository/doctor_repo.dart';
import 'package:geolocator/geolocator.dart';

class DoctorUsecase {
  final DoctorRepo repo;

  DoctorUsecase({required this.repo});

  Future<List<DoctorsModel>> call(double userLat, double userLng) async {
    final doctors = await repo.getDoctors();

    for (var doc in doctors) {
      if (doc.lat == 0 || doc.lng == 0) {
        doc.distance = null;
        continue;
      }

      final distanceInMeters = Geolocator.distanceBetween(
        userLat,
        userLng,
        doc.lat,
        doc.lng,
      );

      doc.distance = distanceInMeters / 1000;
      print("Doctor ${doc.name} | distance: ${doc.distance} km");
    }

    final filteredDoctors = doctors.where((doc) {
      return doc.distance != null && doc.distance! <= 400;
    }).toList();

    filteredDoctors.sort((a, b) => a.distance!.compareTo(b.distance!));

    return filteredDoctors.isNotEmpty ? filteredDoctors : doctors;
  }
}

class GetDoctorsBySpecialtyUseCase {
  final DoctorRepo repo;

  GetDoctorsBySpecialtyUseCase( { required this.repo});

  List<DoctorsModel> call(
      List<DoctorsModel> doctors,
      int specialtyId,
      ) {
    return doctors
        .where((doc) => doc.specialty.id == specialtyId)
        .toList();
  }

}


