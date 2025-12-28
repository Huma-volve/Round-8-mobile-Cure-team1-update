import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/utils/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Data/models/api_doctor.dart';
import '../state/favorite_store.dart';

class ApiDoctorItem extends StatelessWidget {
  final ApiDoctor doctor;
  final VoidCallback? onTap;
  const ApiDoctorItem({super.key, required this.doctor, this.onTap});

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFFD7DCE1);
    const subtitleColor = Color(0xFF8B8F97);
    const textColor = Color(0xFF1F1F1F);
    const starColor = Color(0xFFF5C400);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap ??
            () {
              context.push(AppRoute.doctorDetails, extra: doctor);
            },
        child: Container(
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: SizedBox(
                  height: double.infinity,
                  width: 88,
                  child: _DoctorImage(url: doctor.profilePhoto),
                ),
              ),
              Container(
                width: 1,
                height: double.infinity,
                color: borderColor,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      doctor.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _subtitleText(doctor),
                      style: const TextStyle(
                        fontSize: 13,
                        color: subtitleColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 18,
                          color: starColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          doctor.rating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              ValueListenableBuilder<Set<int>>(
                valueListenable: FavoriteStore.favorites,
                builder: (context, favorites, child) {
                  final isFavorite = favorites.contains(doctor.id);
                  return IconButton(
                    onPressed: () async {
                      final previous = isFavorite;
                      FavoriteStore.setFavoriteById(doctor.id, !previous);
                      final result = await FavoriteStore.toggleRemoteApi(doctor);
                      if (result.isFavorite == null) {
                        FavoriteStore.setFavoriteById(doctor.id, previous);
                        AppToast.show(
                          context,
                          result.message ?? 'Failed to update favorite status.',
                        );
                      }
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : textColor,
                      size: 22,
                    ),
                  );
                },
              ),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class _DoctorImage extends StatelessWidget {
  final String? url;

  const _DoctorImage({this.url});

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      return const _ImagePlaceholder();
    }
    if (!url!.startsWith('http')) {
      return Image.asset(
        url!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => const _ImagePlaceholder(),
      );
    }
    return Image.network(
      url!,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => const _ImagePlaceholder(),
      loadingBuilder: (context, child, progress) {
        if (progress == null) {
          return child;
        }
        return const _ImagePlaceholder();
      },
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF1F3F6),
      child: const Icon(
        Icons.person,
        color: Color(0xFF9AA0A6),
        size: 36,
      ),
    );
  }
}

String _subtitleText(ApiDoctor doctor) {
  final specialty = doctor.specialty;
  final address = doctor.address;
  if (address.isEmpty) {
    return specialty;
  }
  return '$specialty | $address';
}
