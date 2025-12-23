import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_route.dart';
import '../../Data/models/doctor_model.dart';
import '../state/favorite_store.dart';

class DoctorItem extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorItem({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  doctor.image,
                  height: 70,
                  width: 88,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      doctor.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "${doctor.specialty} | ${doctor.hospital}",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          doctor.rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 9),
                        const Icon(
                          Icons.watch_later_outlined,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          doctor.date,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ValueListenableBuilder<Set<int>>(
                valueListenable: FavoriteStore.favorites,
                builder: (context, favorites, child) {
                  final isFavorite = favorites.contains(doctor.id);
                  return IconButton(
                    onPressed: () {
                      FavoriteStore.toggle(doctor);
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
