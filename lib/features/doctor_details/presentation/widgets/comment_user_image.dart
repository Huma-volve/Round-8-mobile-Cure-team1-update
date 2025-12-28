import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentUserImage extends StatelessWidget {
  const CommentUserImage({
    super.key,
    this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: SizedBox(
        height: 62.r,
        width: 62.r,
        child: _buildImage(),
      ),
    );
  }

  Widget _buildImage() {
    final resolvedUrl = _resolveUrl(imageUrl);
    if (resolvedUrl == null) {
      return Image.asset(
        Assets.resourceImagesUserComment,
        fit: BoxFit.cover,
      );
    }
    return Image.network(
      resolvedUrl,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) {
        return Image.asset(
          Assets.resourceImagesUserComment,
          fit: BoxFit.cover,
        );
      },
    );
  }
}

String? _resolveUrl(String? url) {
  if (url == null || url.trim().isEmpty) {
    return null;
  }
  final sanitized = url.trim();
  if (sanitized.startsWith('http://') || sanitized.startsWith('https://')) {
    return sanitized;
  }
  final root = ApiServices.basURL.replaceFirst('/api/', '/');
  if (sanitized.startsWith('/')) {
    return '$root${sanitized.substring(1)}';
  }
  return '$root$sanitized';
}
