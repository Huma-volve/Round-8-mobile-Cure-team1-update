import 'package:flutter/material.dart';

class ImageMessageWidget extends StatelessWidget {
  final String imageUrl;

  const ImageMessageWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(imageUrl),
    );
  }
}
