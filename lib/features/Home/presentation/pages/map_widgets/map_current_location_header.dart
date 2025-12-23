import 'package:flutter/material.dart';

import 'map_theme.dart';

class MapCurrentLocationHeader extends StatelessWidget {
  final String addressText;
  final bool isResolving;
  final VoidCallback onBack;
  final VoidCallback onSearch;

  const MapCurrentLocationHeader({
    super.key,
    required this.addressText,
    required this.isResolving,
    required this.onBack,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 6,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: mapBorderColor),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            IconButton(
              onPressed: onBack,
              icon: const Icon(Icons.arrow_back_ios_new, size: 18),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Current location',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: mapTitleColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: mapAccentColor,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          isResolving ? 'Fetching address...' : addressText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            color: mapAccentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4),
            IconButton(
              onPressed: onSearch,
              icon: const Icon(Icons.search, color: mapAccentColor),
            ),
          ],
        ),
      ),
    );
  }
}
