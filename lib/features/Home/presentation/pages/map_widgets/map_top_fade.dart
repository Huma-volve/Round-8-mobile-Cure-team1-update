import 'package:flutter/material.dart';

class MapTopFade extends StatelessWidget {
  const MapTopFade({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        height: 120,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xE6FFFFFF),
              Color(0x00FFFFFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
