class DoctorAvailabilityResponse {
  final bool success;
  final String? message;
  final List<DoctorAvailabilitySlot> slots;

  const DoctorAvailabilityResponse({
    required this.success,
    this.message,
    required this.slots,
  });

  factory DoctorAvailabilityResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    final slots = data is List
        ? data
            .whereType<Map<String, dynamic>>()
            .map(DoctorAvailabilitySlot.fromJson)
            .toList()
        : <DoctorAvailabilitySlot>[];
    return DoctorAvailabilityResponse(
      success: json['success'] == true,
      message: json['message']?.toString(),
      slots: slots,
    );
  }
}

class DoctorAvailabilitySlot {
  final String date;
  final String startTime;
  final String endTime;
  final String? dayName;

  const DoctorAvailabilitySlot({
    required this.date,
    required this.startTime,
    required this.endTime,
    this.dayName,
  });

  factory DoctorAvailabilitySlot.fromJson(Map<String, dynamic> json) {
    return DoctorAvailabilitySlot(
      date: _stringValue(json['date']),
      startTime: _stringValue(json['start_time']),
      endTime: _stringValue(json['end_time']),
      dayName: _nullableString(json['day_name']),
    );
  }
}

String _stringValue(dynamic value) {
  if (value == null) {
    return '';
  }
  final text = value.toString().trim();
  return text == 'null' ? '' : text;
}

String? _nullableString(dynamic value) {
  final text = _stringValue(value);
  return text.isEmpty ? null : text;
}
