import 'package:flutter/material.dart';

class MapLoadingOverlay extends StatelessWidget {
  const MapLoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.white.withOpacity(0.9),
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: Color(0xFFE7E7E7),
                child: Icon(Icons.person, size: 32, color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'Loading location',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12),
              SizedBox(
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
