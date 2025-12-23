import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../location/Data/DataSource/location_datasoucre.dart';
import '../../location/Data/repo/location_repository_impl.dart';
import '../../location/Domin/entities/user_location.dart';

class MapScreen extends StatefulWidget {
  final UserLocation location;

  const MapScreen({super.key, required this.location});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late final LatLng _initialLatLng =
      LatLng(widget.location.lat, widget.location.lng);
  late final LocationRepositoryImpl _repository =
      LocationRepositoryImpl(LocationDataSource());

  LatLng? _selectedLatLng;
  UserAddress? _selectedAddress;
  bool _isResolving = false;

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

  void _onMapTap(TapPosition tapPosition, LatLng point) {
    setState(() {
      _selectedLatLng = point;
    });
    _resolveAddress(point);
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
  Widget build(BuildContext context) {
    final markerPoint = _selectedLatLng ?? _initialLatLng;
    final addressText = _formatAddress(_selectedAddress);

    return Scaffold(
      appBar: AppBar(title: const Text("Your Location")),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: _initialLatLng,
              initialZoom: 15,
              onTap: _onMapTap,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'com.example.cure_team_1_update',
              ),
              const SimpleAttributionWidget(
                source: Text('OpenStreetMap contributors'),
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: markerPoint,
                    width: 40,
                    height: 40,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Material(
              color: Colors.white,
              elevation: 4,
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _isResolving ? 'Fetching address...' : addressText,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed:
                            _isResolving || _selectedAddress == null
                                ? null
                                : _confirmSelection,
                        child: const Text('Use this location'),
                      ),
                    ),
                  ],
                ),
              ),
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
