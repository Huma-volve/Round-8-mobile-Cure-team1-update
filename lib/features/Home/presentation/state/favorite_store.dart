import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/services/api_services.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/services/shared_pref/shared_pref.dart';
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
    _updateFavorites(updated);
  }

  static void setFavorite(DoctorModel doctor, bool isFavorite) {
    final updated = Set<int>.from(favorites.value);
    if (isFavorite) {
      updated.add(doctor.id);
    } else {
      updated.remove(doctor.id);
    }
    _updateFavorites(updated);
  }

  static Future<FavoriteToggleResult> toggleRemote(DoctorModel doctor) async {
    try {
      final api = getit<ApiServices>();
      final response = await api.post('doctors/${doctor.id}/favorite', {});
      final isFavorite = response?['data']?['is_favorite'];
      if (isFavorite is bool) {
        setFavorite(doctor, isFavorite);
        return FavoriteToggleResult.success(isFavorite);
      }
      return const FavoriteToggleResult.failure(
        'Unexpected response from server.',
      );
    } on DioException catch (error) {
      final data = error.response?.data;
      if (data is Map<String, dynamic> && data['message'] is String) {
        return FavoriteToggleResult.failure(data['message'] as String);
      }
      if (error.response?.statusCode == 401) {
        return const FavoriteToggleResult.failure(
          'Please log in to manage favorites.',
        );
      }
      return const FavoriteToggleResult.failure(
        'Failed to reach server. Try again.',
      );
    } catch (_) {
      return const FavoriteToggleResult.failure(
        'Failed to update favorite status.',
      );
    }
  }

  static List<DoctorModel> currentFavorites() {
    return doctorsList
        .where((doctor) => favorites.value.contains(doctor.id))
        .toList();
  }

  static Set<int> _initialFavorites() {
    if (Cachehelper.hasFavoriteIds()) {
      return Cachehelper.getFavoriteIds();
    }

    return doctorsList
        .where((doctor) => doctor.isFavorite)
        .map((doctor) => doctor.id)
        .toSet();
  }

  static void _updateFavorites(Set<int> updated) {
    favorites.value = updated;
    Cachehelper.cacheFavoriteIds(updated);
  }
}

class FavoriteToggleResult {
  final bool? isFavorite;
  final String? message;

  const FavoriteToggleResult._({this.isFavorite, this.message});

  const FavoriteToggleResult.success(bool value) : this._(isFavorite: value);

  const FavoriteToggleResult.failure(String message) : this._(message: message);
}
