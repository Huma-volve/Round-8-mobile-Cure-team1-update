import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorImage extends StatelessWidget {
  final String? imageUrl;

  const DoctorImage({
    super.key,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 113.r,
          width: 113.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            image: DecorationImage(
              image: _resolveImageProvider(),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 5.r,
          right: -6.r,
          child: Container(
            height: 24.r,
            width: 24.r,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.resourceImagesCheckedImage))),
          ),
        ),
      ],
    );
  }

  ImageProvider _resolveImageProvider() {
    final url = imageUrl;
    if (url == null || url.isEmpty) {
      return const AssetImage(Assets.resourceImagesDoctor);
    }
    if (!url.startsWith('http')) {
      return AssetImage(url);
    }
    return NetworkImage(url);
  }
}
