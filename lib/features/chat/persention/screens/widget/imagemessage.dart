import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:flutter/material.dart';

class ImageMessageWidget extends StatelessWidget {
  final Historymasseges message;

  const ImageMessageWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final url = message.attachment ?? message.body;
    if (url == null || url.isEmpty) {
      return const SizedBox.shrink();
    }
    final resolvedUrl = _resolveAttachmentUrl(url);
    final token = Cachehelper.getToken();
    final headers = (token != null && token.isNotEmpty)
        ? {'Authorization': 'Bearer $token'}
        : null;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 180,
        height: 120,
        child: _NetworkImageWithFallback(
          url: resolvedUrl,
          headers: headers,
        ),
      ),
    );
  }
}

String _resolveAttachmentUrl(String value) {
  if (value.startsWith('http://') || value.startsWith('https://')) {
    return value;
  }
  final root = ApiServices.basURL.replaceFirst('/api/', '/');
  if (value.startsWith('/')) {
    return '$root${value.substring(1)}';
  }
  return '$root$value';
}

class _NetworkImageWithFallback extends StatelessWidget {
  const _NetworkImageWithFallback({
    required this.url,
    this.headers,
  });

  final String url;
  final Map<String, String>? headers;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      headers: headers,
      errorBuilder: (context, error, stackTrace) {
        if (headers != null) {
          return Image.network(
            url,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
          );
        }
        return const Icon(Icons.broken_image);
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(
          child: SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        );
      },
    );
  }
}
