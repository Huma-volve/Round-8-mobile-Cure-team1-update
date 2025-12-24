import 'package:flutter/material.dart';

import 'map_theme.dart';

class MapLocationFab extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onPressed;

  const MapLocationFab({
    super.key,
    required this.isEnabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: mapSurfaceColor,
      elevation: 6,
      shape: const CircleBorder(),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: mapBorderColor),
        ),
        child: IconButton(
          icon: const Icon(Icons.my_location),
          color: mapAccentColor,
          onPressed: isEnabled ? onPressed : null,
          tooltip: 'My location',
        ),
      ),
    );
  }
}
