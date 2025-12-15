import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';



class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Map Example"),

        leading: InkWell(onTap:(){
          GoRouter.of(context).pop();
        },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(30.044, 31.235),
          initialZoom: 13,
          onTap: (tapPosition, point) {
            print("Tapped at: ${point.latitude}, ${point.longitude}");
          },
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.cure_team_1',
          ),
          const MarkerLayer(
            markers: [
              Marker(
                width: 80,
                height: 80,
                point: LatLng(30.044, 31.235),
                child:  Icon(
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
