import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../location/Domin/entities/user_location.dart';

class MapScreen extends StatelessWidget {
  final UserLocation location;

  const MapScreen({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    final LatLng userLatLng = LatLng(
      location.lat,
      location.lng,
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Your Location")),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: userLatLng,
          initialZoom: 15,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: userLatLng,
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
    );
  }
}
