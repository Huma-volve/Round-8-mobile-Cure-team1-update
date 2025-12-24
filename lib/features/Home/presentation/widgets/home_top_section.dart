import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/constants/app_route.dart';
import '../../../../core/services/shared_pref/shared_pref.dart';
import '../../location/Domin/entities/user_location.dart';
import '../../location/presentation/cubit/location_cubit.dart';
import '../../location/presentation/state/location_state.dart';
import '../pages/favorite_page.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 18,
          child: Icon(Icons.person),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Welcome back, ${_resolveUserName()}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
                  if (state is LocationLoading) {
                    return const Skeletonizer(
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 16),
                          SizedBox(width: 4),
                          Text('Loading location'),
                        ],
                      ),
                    );
                  } else if (state is LocationAddressLoaded) {
                    final address = state.address;
                    final formattedAddress = _formatAddress(address);
                    return Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 16),
                        const SizedBox(width: 4),
                        Flexible(
                          child: TextButton(
                            onPressed: () async {
                              final cubitState =
                                  context.read<LocationCubit>().state;

                              if (cubitState is LocationAddressLoaded) {
                                final result =
                                    await context.push<SelectedLocation>(
                                  AppRoute.map,
                                  extra: cubitState.location,
                                );

                                if (result != null) {
                                  context
                                      .read<LocationCubit>()
                                      .setLocationAndAddress(
                                        location: result.location,
                                        address: result.address,
                                      );
                                }
                              }
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              formattedAddress,
                              style: const TextStyle(fontSize: 14),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is LocationError) {
                    return Text(state.message);
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
        _ActionIcon(
          icon: Icons.favorite_border,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FavoritePage()));
          },
        ),
        const SizedBox(
          width: 4,
        ),
        _ActionIcon(
          icon: Icons.notifications_none_outlined,
          onTap: () {
            context.push(AppRoute.notifications);
          },
        ),
      ],
    );
  }
}

String _resolveUserName() {
  final name = Cachehelper.getUserName()?.trim();
  if (name == null || name.isEmpty) {
    return 'there';
  }
  return name;
}

String _formatAddress(UserAddress address) {
  final parts = <String>[
    address.street,
    address.city,
    address.country,
  ].where((part) {
    final normalized = part.trim().toLowerCase();
    return normalized.isNotEmpty && normalized != 'unknown';
  }).toList();

  if (parts.isEmpty) {
    return 'Location unavailable';
  }

  return parts.join(', ');
}

class _ActionIcon extends StatelessWidget {
  const _ActionIcon({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      child: InkWell(
        borderRadius: BorderRadius.circular(17),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(icon),
        ),
      ),
    );
  }
}
