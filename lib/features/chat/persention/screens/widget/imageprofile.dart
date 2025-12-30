import 'package:cached_network_image/cached_network_image.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:flutter/material.dart';

class Imageprofile extends StatelessWidget {
  const Imageprofile({super.key, required this.image, this.size = 48});

  final String? image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: size,
        height: size,
        child: image == null
            ? Container(
                color: ColorsLight.border,
                child: Icon(Icons.person, size: size * 0.6),
              )
            : CachedNetworkImage(
                imageUrl: image!,
                width: size,
                height: size,
                fit: BoxFit.cover,
                placeholder: (_, __) => Container(
                  color: ColorsLight.border,
                  child: Icon(Icons.person, size: size * 0.6),
                ),
                errorWidget: (_, __, ___) =>
                    Icon(Icons.person, size: size * 0.6),
              ),
      ),
    );
  }
}
