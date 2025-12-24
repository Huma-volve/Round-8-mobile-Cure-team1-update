import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cure_team_1_update/core/utils/app_toast.dart';

import '../../../../core/constants/app_route.dart';
import '../../Data/models/specialty_model.dart';
import '../../location/Domin/entities/user_location.dart';
import '../../location/presentation/cubit/location_cubit.dart';
import '../../location/presentation/state/location_state.dart';
import '../widgets/speciality_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Search"),
        leading: InkWell(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        child: Column(children: [
          TextFormField(
            decoration: InputDecoration(
                hintText: "Search for specialty, doctor..",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  "Search by your location",
                  style: TextStyle(fontSize: 17),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              BlocBuilder<LocationCubit, LocationState>(
                builder: (context, state) {
                  final label = _locationLabel(state);
                  return Flexible(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () async {
                          final cubit = context.read<LocationCubit>();
                          final currentState = cubit.state;
                          if (currentState is! LocationAddressLoaded) {
                            AppToast.show(
                              context,
                              'Location is not ready yet.',
                            );
                            return;
                          }

                          final result =
                              await context.push<SelectedLocation>(
                            AppRoute.map,
                            extra: currentState.location,
                          );

                          if (!context.mounted || result == null) {
                            return;
                          }

                          cubit.setLocationAndAddress(
                            location: result.location,
                            address: result.address,
                          );

                          if (context.canPop()) {
                            context.pop();
                          }
                        },
                        child: Text(
                          label,
                          style: const TextStyle(color: Colors.blueAccent),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          const Text(
            textAlign: TextAlign.start,
            'All Specialties',
            style: TextStyle(fontSize: 19),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 14, // مسافة بين العناصر
            runSpacing: 10, // مسافة بين السطور
            children: [
              ...Specialty.specialties
                  .map((e) => SpecialityWidget(specialty: e))
                  ,
            ],
          )
        ]),
      ),
    );
  }
}

String _locationLabel(LocationState state) {
  if (state is LocationLoading) {
    return 'Fetching location...';
  }

  if (state is LocationAddressLoaded) {
    final address = state.address;
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

  if (state is LocationError) {
    return 'Tap to set location';
  }

  return 'Tap to set location';
}
