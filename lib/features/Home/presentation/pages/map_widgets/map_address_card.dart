import 'package:flutter/material.dart';

import 'map_theme.dart';

class MapAddressCard extends StatelessWidget {
  final bool isResolving;
  final String addressText;
  final bool canConfirm;
  final VoidCallback onConfirm;

  const MapAddressCard({
    super.key,
    required this.isResolving,
    required this.addressText,
    required this.canConfirm,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: mapSurfaceColor,
      elevation: 8,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: mapBorderColor),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.place, size: 18),
                const SizedBox(width: 6),
                Text(
                  isResolving ? 'Finding your address' : 'Selected location',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: mapTitleColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              isResolving ? 'Please wait...' : addressText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF4A4A4A),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: isResolving || !canConfirm ? null : onConfirm,
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Use this location'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: mapAccentColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
