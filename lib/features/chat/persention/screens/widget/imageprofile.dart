import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Imageprofile extends StatelessWidget {
  const Imageprofile({super.key, required this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: image == null
          ? const Icon(Icons.person, size: 40)
          : CachedNetworkImage(
              imageUrl: image!,
              width: 55,
              height: 55,
              fit: BoxFit.cover,
              placeholder: (_, __) => const CircularProgressIndicator(),
              errorWidget: (_, __, ___) => const Icon(Icons.person),
            ),
    );
  }
}
