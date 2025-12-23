import 'package:flutter/foundation.dart';

import '../../Data/models/doctor_model.dart';

class FavoriteStore {
  static final ValueNotifier<Set<int>> favorites =
      ValueNotifier(_initialFavorites());

  static bool isFavorite(DoctorModel doctor) {
    return favorites.value.contains(doctor.id);
  }

  static void toggle(DoctorModel doctor) {
    final updated = Set<int>.from(favorites.value);
    if (updated.contains(doctor.id)) {
      updated.remove(doctor.id);
    } else {
      updated.add(doctor.id);
    }
    favorites.value = updated;
  }

  static List<DoctorModel> currentFavorites() {
    return doctorsList
        .where((doctor) => favorites.value.contains(doctor.id))
        .toList();
  }

  static Set<int> _initialFavorites() {
    return doctorsList
        .where((doctor) => doctor.isFavorite)
        .map((doctor) => doctor.id)
        .toSet();
  }
}
