import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cure_team_1_update/core/utils/app_toast.dart';

import '../../../../core/constants/app_route.dart';
import '../../Data/models/doctor_model.dart';
import '../state/favorite_store.dart';

class DoctorItem extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorItem({super.key, required this.doctor});

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
        onTap: () {
          context.push(AppRoute.doctorDetails);
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
                  child: Image.asset(
                    doctor.image,
                    fit: BoxFit.cover,
                  ),
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
                      "${doctor.specialty} | ${doctor.hospital}",
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
                          doctor.rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(
                          Icons.watch_later_outlined,
                          size: 18,
                          color: subtitleColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          doctor.date,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
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
                      FavoriteStore.setFavorite(doctor, !previous);
                      final result =
                          await FavoriteStore.toggleRemote(doctor);
                      if (result.isFavorite == null) {
                        FavoriteStore.setFavorite(doctor, previous);
                        AppToast.show(
                          context,
                          result.message ??
                              'Failed to update favorite status.',
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
