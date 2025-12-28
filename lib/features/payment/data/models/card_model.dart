class CardModel {
  final int id;
  final String brand;
  final String lastFour;
  final int expMonth;
  final int expYear;
  final bool isDefault;

  const CardModel({
    required this.id,
    required this.brand,
    required this.lastFour,
    required this.expMonth,
    required this.expYear,
    required this.isDefault,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: _asInt(json['id']) ?? 0,
      brand: _asString(json['brand']) ?? '',
      lastFour: _asString(json['last_four']) ??
          _asString(json['lastFour']) ??
          '',
      expMonth: _asInt(json['exp_month']) ?? 0,
      expYear: _asInt(json['exp_year']) ?? 0,
      isDefault: _asBool(json['is_default'] ?? json['isDefault']),
    );
  }

  CardModel copyWith({
    int? id,
    String? brand,
    String? lastFour,
    int? expMonth,
    int? expYear,
    bool? isDefault,
  }) {
    return CardModel(
      id: id ?? this.id,
      brand: brand ?? this.brand,
      lastFour: lastFour ?? this.lastFour,
      expMonth: expMonth ?? this.expMonth,
      expYear: expYear ?? this.expYear,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  String get maskedNumber => '**** $lastFour';

  String get expiryLabel {
    final month = expMonth.toString().padLeft(2, '0');
    final year = (expYear % 100).toString().padLeft(2, '0');
    return '$month/$year';
  }

  static List<CardModel> listFromResponse(dynamic response) {
    final items = _extractList(response);
    return items
        .whereType<Map>()
        .map((item) => CardModel.fromJson(item.cast<String, dynamic>()))
        .toList();
  }

  static CardModel fromResponse(dynamic response) {
    final data = _extractMap(response);
    return CardModel.fromJson(data);
  }
}

Map<String, dynamic> _extractMap(dynamic response) {
  if (response is Map<String, dynamic>) {
    if (response.containsKey('data')) {
      final data = response['data'];
      if (data is Map<String, dynamic>) {
        return data;
      }
    }
    return response;
  }
  return <String, dynamic>{};
}

List<dynamic> _extractList(dynamic response) {
  if (response is List) {
    return response;
  }
  if (response is Map<String, dynamic>) {
    final data = response['data'] ?? response['cards'];
    if (data is List) {
      return data;
    }
    if (data is Map<String, dynamic>) {
      final nested = data['data'] ?? data['cards'] ?? data['items'];
      if (nested is List) {
        return nested;
      }
    }
  }
  return const [];
}

int? _asInt(dynamic value) {
  if (value is int) {
    return value;
  }
  if (value is num) {
    return value.toInt();
  }
  if (value is String) {
    return int.tryParse(value);
  }
  return null;
}

String? _asString(dynamic value) {
  if (value is String) {
    return value;
  }
  if (value != null) {
    return value.toString();
  }
  return null;
}

bool _asBool(dynamic value) {
  if (value is bool) {
    return value;
  }
  if (value is num) {
    return value != 0;
  }
  if (value is String) {
    final normalized = value.toLowerCase();
    return normalized == 'true' || normalized == '1';
  }
  return false;
}
