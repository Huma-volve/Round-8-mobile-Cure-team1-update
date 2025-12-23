import 'package:cure_team_1_update/features/Home/Doctor/Data/model/specialty_model.dart';

class DoctorsModel {
  final int id;
  final String name;
  final double lat;
  final double lng;
  double? distance;
  final String clinic;
  final SpecialtyModel specialty;
  final String? image ;

  DoctorsModel({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
    required this.clinic,
    required this.specialty,
    this.distance,
    this.image
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> json) {
    return DoctorsModel(
      id: json['id'],
      name: json['name'],
     // image: json['profile_photo'] ?? "assets/images/48de4c7e2653d6ae038592eb93a42c2bd2b7b666.jpg",
      lat: (json['location']['latitude'] as num).toDouble(),
      lng: (json['location']['longitude'] as num).toDouble(),
      clinic: json['clinic_address'],
      specialty: SpecialtyModel.fromJson(json['specialty']),
    );
  }
}
