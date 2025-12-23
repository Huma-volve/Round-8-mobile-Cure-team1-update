import 'package:flutter/material.dart';

import 'map_theme.dart';

class MapAddressCard extends StatelessWidget {
  final bool isResolving;
  final bool canConfirm;
  final VoidCallback onConfirm;

  const MapAddressCard({
    super.key,
    required this.isResolving,
    required this.canConfirm,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isResolving || !canConfirm ? null : onConfirm,
        style: ElevatedButton.styleFrom(
          backgroundColor: mapAccentColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 6,
        ),
        child: Text(isResolving ? 'Loading...' : 'Confirm location'),
      ),
    );
  }
}
