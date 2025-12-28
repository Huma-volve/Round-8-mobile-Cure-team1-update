class DoctorReviewsResponse {
  final bool success;
  final DoctorReviewsDoctor? doctor;
  final List<DoctorReview> reviews;

  const DoctorReviewsResponse({
    required this.success,
    this.doctor,
    required this.reviews,
  });

  factory DoctorReviewsResponse.fromJson(Map<String, dynamic> json) {
    final reviewsData = json['data'];
    final reviews = reviewsData is List
        ? reviewsData
            .whereType<Map<String, dynamic>>()
            .map(DoctorReview.fromJson)
            .toList()
        : <DoctorReview>[];

    final doctorData = json['doctor'];
    return DoctorReviewsResponse(
      success: json['success'] == true,
      doctor: doctorData is Map<String, dynamic>
          ? DoctorReviewsDoctor.fromJson(doctorData)
          : null,
      reviews: reviews,
    );
  }
}

class DoctorReviewsDoctor {
  final int id;
  final String name;
  final double? averageRating;

  const DoctorReviewsDoctor({
    required this.id,
    required this.name,
    required this.averageRating,
  });

  factory DoctorReviewsDoctor.fromJson(Map<String, dynamic> json) {
    return DoctorReviewsDoctor(
      id: _intValue(json['id']) ?? 0,
      name: _stringValue(json['name'], fallback: 'Doctor'),
      averageRating:
          _doubleValue(json['average_rating'] ?? json['averageRating']),
    );
  }
}

class DoctorReview {
  final int id;
  final double rating;
  final String comment;
  final String? doctorResponse;
  final String? createdAt;
  final String? respondedAt;
  final ReviewPatient? patient;

  const DoctorReview({
    required this.id,
    required this.rating,
    required this.comment,
    this.doctorResponse,
    this.createdAt,
    this.respondedAt,
    this.patient,
  });

  factory DoctorReview.fromJson(Map<String, dynamic> json) {
    final patientData = json['patient'];
    return DoctorReview(
      id: _intValue(json['id']) ?? 0,
      rating: _doubleValue(json['rating']) ?? 0,
      comment: _stringValue(json['comment']),
      doctorResponse: _nullableString(json['doctor_response']),
      createdAt: _nullableString(json['created_at']),
      respondedAt: _nullableString(json['responded_at']),
      patient: patientData is Map<String, dynamic>
          ? ReviewPatient.fromJson(patientData)
          : null,
    );
  }
}

class ReviewPatient {
  final int id;
  final String name;
  final String? photo;

  const ReviewPatient({
    required this.id,
    required this.name,
    this.photo,
  });

  factory ReviewPatient.fromJson(Map<String, dynamic> json) {
    return ReviewPatient(
      id: _intValue(json['id']) ?? 0,
      name: _stringValue(json['name'], fallback: 'Patient'),
      photo: _nullableString(json['photo']),
    );
  }
}

int? _intValue(dynamic value) {
  if (value is num) {
    return value.toInt();
  }
  if (value is String) {
    return int.tryParse(value.trim());
  }
  return null;
}

double? _doubleValue(dynamic value) {
  if (value is num) {
    return value.toDouble();
  }
  if (value is String) {
    return double.tryParse(value.trim());
  }
  return null;
}

String _stringValue(dynamic value, {String fallback = ''}) {
  if (value == null) {
    return fallback;
  }
  final text = value.toString().trim();
  if (text.isEmpty || text == 'null') {
    return fallback;
  }
  return text;
}

String? _nullableString(dynamic value) {
  final text = _stringValue(value);
  return text.isEmpty ? null : text;
}
