class ApiDoctor {
  final int id;
  final String name;
  final String specialty;
  final String address;
  final String clinicAddress;
  final String? profilePhoto;
  final double rating;
  final bool isFavorite;
  final double? latitude;
  final double? longitude;
  final String aboutMe;
  final int? experienceYears;
  final double? sessionPrice;

  const ApiDoctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.address,
    required this.clinicAddress,
    required this.profilePhoto,
    required this.rating,
    required this.isFavorite,
    required this.latitude,
    required this.longitude,
    required this.aboutMe,
    required this.experienceYears,
    required this.sessionPrice,
  });

  factory ApiDoctor.fromJson(Map<String, dynamic> json) {
    String stringValue(dynamic value) {
      if (value == null) {
        return '';
      }
      final text = value.toString().trim();
      return text == 'null' ? '' : text;
    }

    double? doubleValue(dynamic value) {
      if (value is num) {
        return value.toDouble();
      }
      if (value is String) {
        return double.tryParse(value.trim());
      }
      return null;
    }

    int? intValue(dynamic value) {
      if (value is num) {
        return value.toInt();
      }
      if (value is String) {
        return int.tryParse(value.trim());
      }
      return null;
    }

    final specialtyData = json['specialty'];
    final specialtyName = specialtyData is Map<String, dynamic>
        ? stringValue(specialtyData['name'])
        : stringValue(json['specialty_name']);
    final location = json['location'];
    final latValue = location is Map<String, dynamic>
        ? location['latitude'] ?? location['lat']
        : json['latitude'] ?? json['lat'];
    final lngValue = location is Map<String, dynamic>
        ? location['longitude'] ?? location['lng']
        : json['longitude'] ?? json['lng'];
    final latitude = doubleValue(latValue);
    final longitude = doubleValue(lngValue);
    final ratingValue =
        json['rate'] ?? json['rating'] ?? json['stars'] ?? json['avg_rating'];
    final rating = doubleValue(ratingValue) ?? 0.0;
    final favoriteValue =
        json['is_favorite'] ?? json['isFavourite'] ?? json['favorite'];
    final isFavorite = favoriteValue == true ||
        favoriteValue == 1 ||
        (favoriteValue is String && favoriteValue.toLowerCase() == 'true');
    final aboutMe = stringValue(
      json['about_me'] ?? json['aboutMe'] ?? json['about'] ?? json['bio'],
    );
    final experienceYears = intValue(
      json['experience_years'] ?? json['experienceYears'] ?? json['experience'],
    );
    final sessionPrice = doubleValue(
      json['session_price'] ?? json['sessionPrice'] ?? json['price'],
    );
    final address = stringValue(json['address']);
    final clinicAddress =
        stringValue(json['clinic_address'] ?? json['clinicAddress']);

    return ApiDoctor(
      id: intValue(json['id'] ?? json['doctor_id'] ?? json['doctorId']) ?? 0,
      name: stringValue(json['name'] ?? json['full_name']).isEmpty
          ? 'Unknown doctor'
          : stringValue(json['name'] ?? json['full_name']),
      specialty: specialtyName.isEmpty ? 'Unknown' : specialtyName,
      address: address,
      clinicAddress: clinicAddress,
      profilePhoto: stringValue(json['profile_photo'] ?? json['image']).isEmpty
          ? null
          : stringValue(json['profile_photo'] ?? json['image']),
      rating: rating,
      isFavorite: isFavorite,
      latitude: latitude,
      longitude: longitude,
      aboutMe: aboutMe,
      experienceYears: experienceYears,
      sessionPrice: sessionPrice,
    );
  }

  ApiDoctor copyWith({bool? isFavorite}) {
    return ApiDoctor(
      id: id,
      name: name,
      specialty: specialty,
      address: address,
      clinicAddress: clinicAddress,
      profilePhoto: profilePhoto,
      rating: rating,
      isFavorite: isFavorite ?? this.isFavorite,
      latitude: latitude,
      longitude: longitude,
      aboutMe: aboutMe,
      experienceYears: experienceYears,
      sessionPrice: sessionPrice,
    );
  }
}
