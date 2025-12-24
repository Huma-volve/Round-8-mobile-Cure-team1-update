import 'package:flutter/material.dart';

class MapLoadingOverlay extends StatelessWidget {
  const MapLoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.white.withOpacity(0.9),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircleAvatar(
                radius: 36,
                backgroundColor: Color(0xFFE7E7E7),
                child: Icon(Icons.person, size: 32, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                'Loading location',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              const SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
