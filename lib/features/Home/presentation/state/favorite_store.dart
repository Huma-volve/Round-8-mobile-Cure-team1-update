import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/services/api_services.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/services/shared_pref/shared_pref.dart';
import '../../Data/models/doctor_api_model.dart';
import '../../Data/models/doctor_model.dart';

class FavoriteStore {
  static final ValueNotifier<Set<int>> favorites =
  ValueNotifier(_initialFavorites());
  static final ValueNotifier<List<ApiDoctor>> favoriteDoctors =
  ValueNotifier(<ApiDoctor>[]);
  static bool _syncInProgress = false;
  static bool _hasSynced = false;
  static String? _lastToken;

  static bool isFavorite(ApiDoctor doctor) {
    return favorites.value.contains(doctor.id);
  }

 static void setFavoriteById(int doctorId, bool isFavorite) {
    final updated = Set<int>.from(favorites.value);
    if (isFavorite) {
      updated.add(doctorId);
    } else {
      updated.remove(doctorId);
    }
    _updateFavorites(updated);
  }

  static Future<FavoriteToggleResult> toggleRemoteApi(ApiDoctor doctor) async {
    return _toggleRemote(
      doctorId: doctor.id,
      apiDoctor: doctor,
    );
  }

 static Future<FavoriteToggleResult> _toggleRemote({
    required int doctorId,
    ApiDoctor? apiDoctor,
  }) async {
    final token = Cachehelper.getToken();
    if (token == null || token.isEmpty) {
      return const FavoriteToggleResult.failure(
        'Please log in to manage favorites.',
      );
    }
    try {
      final api = getIt<ApiServices>();
      final response = await api.post('doctors/$doctorId/favorite', {});
      final isFavorite = response?['data']?['is_favorite'];
      if (isFavorite is bool) {
        setFavoriteById(doctorId, isFavorite);
        _updateFavoriteDoctorsList(
          doctorId: doctorId,
          isFavorite: isFavorite,
          apiDoctor: apiDoctor,
        );
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


  static Future<void> ensureSynced() async {
    final token = Cachehelper.getToken();
    if (token == null || token.isEmpty) {
      return;
    }
    if (_hasSynced && _lastToken == token) {
      return;
    }
    if (_syncInProgress) {
      return;
    }
    _syncInProgress = true;
    try {
      await refreshFromServer();
      _lastToken = token;
      _hasSynced = true;
    } finally {
      _syncInProgress = false;
    }
  }

  static Future<void> refreshFromServer() async {
    final token = Cachehelper.getToken();
    if (token == null || token.isEmpty) {
      return;
    }
    try {
      final api = getIt<ApiServices>();
      final response = await api.get('profile/favorites');
      final doctors = _extractFavoriteDoctors(response);
      if (doctors.isNotEmpty) {
        favoriteDoctors.value = doctors;
        _updateFavorites(doctors.map((doctor) => doctor.id).toSet());
      } else {
        favoriteDoctors.value = <ApiDoctor>[];
        _updateFavorites(_extractFavoriteIds(response));
      }
    } catch (_) {}
  }

  static List<ApiDoctor> currentFavorites() {
    return favoriteDoctors.value;
  }


  static Set<int> _initialFavorites() {
    if (Cachehelper.hasFavoriteIds()) {
      return Cachehelper.getFavoriteIds();
    }

    return <int>{};
  }

  static void _updateFavorites(Set<int> updated) {
    favorites.value = updated;
    Cachehelper.cacheFavoriteIds(updated);
  }

 static void _updateFavoriteDoctorsList({
    required int doctorId,
    required bool isFavorite,
    ApiDoctor? apiDoctor,
  }) {
    final current = List<ApiDoctor>.from(favoriteDoctors.value);
    if (isFavorite) {
      final exists = current.any((doctor) => doctor.id == doctorId);
      if (!exists) {
        if (apiDoctor != null) {
          current.add(apiDoctor.copyWith(isFavorite: true));
        }
      }
    } else {
      current.removeWhere((doctor) => doctor.id == doctorId);
    }
    favoriteDoctors.value = current;
  }

  static Set<int> _extractFavoriteIds(dynamic response) {
    final items = _extractFavoriteList(response);
    final ids = <int>{};
    for (final item in items) {
      if (item is int) {
        ids.add(item);
      } else if (item is String) {
        final id = int.tryParse(item);
        if (id != null) {
          ids.add(id);
        }
      } else if (item is Map) {
        final rawId = item['doctor_id'] ??
            item['doctorId'] ??
            item['id'] ??
            (item['doctor'] is Map ? item['doctor']['id'] : null);
        if (rawId is int) {
          ids.add(rawId);
        } else if (rawId is String) {
          final id = int.tryParse(rawId);
          if (id != null) {
            ids.add(id);
          }
        }
      }
    }
    return ids;
  }

  static List<dynamic> _extractFavoriteList(dynamic response) {
    if (response is List) {
      return response;
    }
    if (response is Map) {
      final data = response['data'] ?? response['favorites'];
      if (data is List) {
        return data;
      }
      if (data is Map) {
        final nested = data['favorites'] ??
            data['data'] ??
            data['items'] ??
            data['doctors'];
        if (nested is List) {
          return nested;
        }
      }
    }
    return const [];
  }

  static List<ApiDoctor> _extractFavoriteDoctors(dynamic response) {
    final items = _extractFavoriteList(response);
    final doctors = <ApiDoctor>[];
    for (final item in items) {
      if (item is Map<String, dynamic>) {
        final doctorJson = item['doctor'] is Map<String, dynamic>
            ? item['doctor'] as Map<String, dynamic>
            : item;
        doctors.add(ApiDoctor.fromJson(doctorJson));
      }
    }
    return doctors;
  }
}
class FavoriteToggleResult {
  final bool? isFavorite;
  final String? message;

  const FavoriteToggleResult._({this.isFavorite, this.message});

  const FavoriteToggleResult.success(bool value) : this._(isFavorite: value);

  const FavoriteToggleResult.failure(String message) : this._(message: message);
}
