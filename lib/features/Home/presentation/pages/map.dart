import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../location/Data/DataSource/location_datasoucre.dart';
import '../../location/Data/repo/location_repository_impl.dart';
import '../../location/Domin/entities/user_location.dart';
import 'map_widgets/map_address_card.dart';
import 'map_widgets/map_app_bar.dart';
import 'map_widgets/map_location_fab.dart';
import 'map_widgets/map_search_panel.dart';
import 'map_widgets/map_top_fade.dart';
import 'map_widgets/map_view.dart';
import 'map_widgets/place_suggestion.dart';

class MapScreen extends StatefulWidget {
  final UserLocation location;

  const MapScreen({super.key, required this.location});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  late final LatLng _initialLatLng =
      LatLng(widget.location.lat, widget.location.lng);
  late final LocationRepositoryImpl _repository =
      LocationRepositoryImpl(LocationDataSource());

  LatLng? _selectedLatLng;
  UserAddress? _selectedAddress;
  bool _isResolving = false;
  bool _isSearching = false;
  Timer? _debounce;
  List<PlaceSuggestion> _suggestions = [];

  @override
  void initState() {
    super.initState();
    _selectedLatLng = _initialLatLng;
    _resolveAddress(_initialLatLng);
  }

  Future<void> _resolveAddress(LatLng point) async {
    setState(() {
      _isResolving = true;
      _selectedAddress = null;
    });

    try {
      final address = await _repository.getUserAddress(
        lat: point.latitude,
        lng: point.longitude,
      );
      if (!mounted) return;
      setState(() {
        _selectedAddress = address;
        _isResolving = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _selectedAddress = null;
        _isResolving = false;
      });
    }
  }

  void _onMapTap(LatLng point) {
    setState(() {
      _selectedLatLng = point;
    });
    _resolveAddress(point);
  }

  void _onSearchChanged(String query) {
    _debounce?.cancel();
    final trimmed = query.trim();
    if (trimmed.isEmpty) {
      setState(() {
        _suggestions = [];
        _isSearching = false;
      });
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 350), () {
      _searchPlaces(trimmed);
    });
  }

  Future<void> _searchPlaces(String query) async {
    setState(() {
      _isSearching = true;
    });

    try {
      final dio = Dio(BaseOptions(headers: const {
        'User-Agent': 'cure-team-1-update',
      }));
      final response = await dio.get(
        'https://nominatim.openstreetmap.org/search',
        queryParameters: {
          'format': 'jsonv2',
          'q': query,
          'addressdetails': 1,
          'limit': 5,
        },
      );

      final results = <PlaceSuggestion>[];
      for (final item in (response.data as List<dynamic>)) {
        final map = item as Map<String, dynamic>;
        final name = (map['display_name'] as String?)?.trim();
        final lat = double.tryParse(map['lat']?.toString() ?? '');
        final lng = double.tryParse(map['lon']?.toString() ?? '');
        if (name == null || name.isEmpty || lat == null || lng == null) {
          continue;
        }
        results.add(PlaceSuggestion(name: name, lat: lat, lng: lng));
      }

      if (!mounted) return;
      setState(() {
        _suggestions = results;
        _isSearching = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _suggestions = [];
        _isSearching = false;
      });
    }
  }

  void _selectSuggestion(PlaceSuggestion suggestion) {
    final target = LatLng(suggestion.lat, suggestion.lng);
    setState(() {
      _selectedLatLng = target;
      _searchController.text = suggestion.name;
      _suggestions = [];
    });
    _searchFocusNode.unfocus();
    _mapController.move(target, 15);
    _resolveAddress(target);
  }

  Future<void> _goToCurrentLocation() async {
    setState(() {
      _isResolving = true;
    });

    try {
      final location = await _repository.getUserLocation();
      if (!mounted) return;
      final target = LatLng(location.lat, location.lng);
      setState(() {
        _selectedLatLng = target;
      });
      _mapController.move(target, 15);
      await _resolveAddress(target);
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isResolving = false;
      });
    }
  }

  void _confirmSelection() {
    final selectedPoint = _selectedLatLng ?? _initialLatLng;
    final address = _selectedAddress;
    if (address == null) return;

    final result = SelectedLocation(
      location: UserLocation(
        lat: selectedPoint.latitude,
        lng: selectedPoint.longitude,
      ),
      address: address,
    );

    context.pop(result);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final markerPoint = _selectedLatLng ?? _initialLatLng;
    final addressText = _formatAddress(_selectedAddress);

    return Scaffold(
      appBar: const MapAppBar(),
      body: Stack(
        children: [
          MapView(
            mapController: _mapController,
            initialLatLng: _initialLatLng,
            markerPoint: markerPoint,
            onTap: _onMapTap,
          ),
          const MapTopFade(),
          Positioned(
            left: 16,
            right: 16,
            top: 16,
            child: MapSearchPanel(
              controller: _searchController,
              focusNode: _searchFocusNode,
              isSearching: _isSearching,
              suggestions: _suggestions,
              onChanged: _onSearchChanged,
              onSuggestionTap: _selectSuggestion,
            ),
          ),
          Positioned(
            right: 16,
            bottom: 140,
            child: MapLocationFab(
              isEnabled: !_isResolving,
              onPressed: _goToCurrentLocation,
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: MapAddressCard(
              isResolving: _isResolving,
              addressText: addressText,
              canConfirm: _selectedAddress != null,
              onConfirm: _confirmSelection,
            ),
          ),
        ],
      ),
    );
  }
}

String _formatAddress(UserAddress? address) {
  if (address == null) {
    return 'Tap on the map to choose a location';
  }

  final parts = <String>[
    address.street,
    address.city,
    address.country,
  ].where((part) {
    final normalized = part.trim().toLowerCase();
    return normalized.isNotEmpty && normalized != 'unknown';
  }).toList();

  if (parts.isEmpty) {
    return 'Location unavailable';
  }

  return parts.join(', ');
}
