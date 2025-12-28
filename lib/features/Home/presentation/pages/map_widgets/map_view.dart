import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'map_theme.dart';

class MapView extends StatelessWidget {
  final MapController mapController;
  final LatLng initialLatLng;
  final LatLng markerPoint;
  final ValueChanged<LatLng> onTap;

  const MapView({
    super.key,
    required this.mapController,
    required this.initialLatLng,
    required this.markerPoint,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: initialLatLng,
        initialZoom: 15,
        onTap: (tapPosition, point) => onTap(point),
      ),
      children: [
        TileLayer(
          urlTemplate:
              "https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png",
          subdomains: const ['a', 'b', 'c', 'd'],
          userAgentPackageName: 'com.example.cure_team_1_update',
        ),
        const SimpleAttributionWidget(
          source: Text('OpenStreetMap contributors (c) CARTO'),
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: markerPoint,
              width: 56,
              height: 56,
              child: const _LocationMarker(),
            ),
          ],
        ),
      ],
    );
  }
}

class _LocationMarker extends StatelessWidget {
  const _LocationMarker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.18),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.place,
          color: mapPinColor,
          size: 40,
        ),
      ],
    );
  }
}
