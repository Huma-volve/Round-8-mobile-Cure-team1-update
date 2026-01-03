import 'dart:math' as math;

import 'package:cure_team_1_update/features/Home/Data/models/doctor_model.dart';
import 'package:cure_team_1_update/features/Home/location/Domin/entities/user_location.dart';
import 'package:cure_team_1_update/features/Home/presentation/pages/search_page.dart';
import 'package:cure_team_1_update/features/Home/presentation/pages/veiw_all_specialties.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../location/presentation/cubit/location_cubit.dart';
import '../../location/presentation/state/location_state.dart';
import '../pages/doctors_list_page.dart';
import '../widgets/api_doctor_item.dart';
import '../widgets/home_top_section.dart';
import '../widgets/specialties_list.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationCubit>(
      create: (_) => getIt<LocationCubit>()..fetchLocationAndAddress(),
      child: const _HomePageContent(),
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _fetchDoctors();
  }

  Future<void> _fetchDoctors() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final api = getIt<ApiServices>();
      final response = await api.get('doctors');
      final doctors = _parseDoctors(response);
      if (!mounted) return;
      setState(() {
        _doctors = doctors;
        _isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _error = 'Failed to load doctors. Try again.';
        _isLoading = false;
      });
    }
  }

  List<ApiDoctor> _parseDoctors(dynamic response) {
    if (response is Map<String, dynamic>) {
      final data = response['data'];
      if (data is List) {
        return data
            .whereType<Map<String, dynamic>>()
            .map(ApiDoctor.fromJson)
            .toList();
      }
    }
    return <ApiDoctor>[];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const HomeTopSection(),
            const SizedBox(
              height: 23,
            ),
            TextFormField(
              readOnly: true,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchPage()));
              },
              decoration: InputDecoration(
                  hintText: "Search for specialty, doctor..",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              const Expanded(
                child: Text(
                  "Specialties",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ViewAllSpecialties()));
                  },
                  child: const Text(
                    "View all",
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  )),
            ]),
            const SizedBox(
              height: 6,
            ),
            const SpecialtiesList(),
            const SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              child: Image.asset(
                  fit: BoxFit.fill,
                  height: 150.h,
                  "assets/images/Mask_group.png"),
            ),
            Row(children: [
              const Expanded(
                child: Text(
                  "Doctors near you",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Veiw all",
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  )),
            ]),
            BlocListener<LocationCubit, LocationState>(
              listener: (context, state) {
                if (state is LocationAddressLoaded) {
                  final lat = state.location.lat;
                  final lng = state.location.lng;
                  context.read<DoctorCubit>().loadDoctor();
                }
                if (_doctors.isEmpty) {
                  return const Text('No doctors found.');
                }
                final doctors = state is LocationAddressLoaded
                    ? _nearbyDoctors(state.location, _doctors)
                    : _doctors;
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    return ApiDoctorItem(doctor: doctors[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 12);
                  },
                );
              },
              child: BlocBuilder<DoctorCubit, DoctorState>(
                builder: (context, state) {
                  if (state is DoctorLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DoctorLoaded) {
                    final doctors = state.doctors;
                    if (doctors.isEmpty) {
                      return const Center(child: Text("No doctors found"));
                    }
                    return SizedBox(
                      height: 350,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: doctors.length,
                        itemBuilder: (context, index) {
                          final doc = doctors[index];
                          return DoctorItem(
                            doctor: doc,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                      ),
                    );
                  } else if (state is DoctorError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox();
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}

const double _earthRadiusKm = 6371;
const double _maxNearbyDistanceKm = 50;

List<ApiDoctor> _nearbyDoctors(
  UserLocation location,
  List<ApiDoctor> doctors,
) {
  final doctorsWithDistance = doctors.map((doctor) {
    final lat = doctor.latitude;
    final lng = doctor.longitude;
    final distance = lat != null && lng != null
        ? _distanceKm(
            location.lat,
            location.lng,
            lat,
            lng,
          )
        : double.infinity;
    return (doctor: doctor, distance: distance);
  }).toList();

  doctorsWithDistance.sort((a, b) => a.distance.compareTo(b.distance));

  final nearby = doctorsWithDistance
      .where((entry) => entry.distance <= _maxNearbyDistanceKm)
      .map((entry) => entry.doctor)
      .toList();

  if (nearby.isEmpty) {
    return doctorsWithDistance.map((entry) => entry.doctor).toList();
  }

  return nearby;
}

double _distanceKm(double lat1, double lng1, double lat2, double lng2) {
  final dLat = _degreesToRadians(lat2 - lat1);
  final dLng = _degreesToRadians(lng2 - lng1);
  final a = math.pow(math.sin(dLat / 2), 2) +
      math.cos(_degreesToRadians(lat1)) *
          math.cos(_degreesToRadians(lat2)) *
          math.pow(math.sin(dLng / 2), 2);
  final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  return _earthRadiusKm * c;
}

double _degreesToRadians(double degrees) {
  return degrees * (math.pi / 180);
}

class _DoctorSkeletonList extends StatelessWidget {
  const _DoctorSkeletonList();

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return const _DoctorSkeletonCard();
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 12);
        },
      ),
    );
  }
}

class _DoctorSkeletonCard extends StatelessWidget {
  const _DoctorSkeletonCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: const Row(
        children: [
          CircleAvatar(radius: 40),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Doctor Name'),
                SizedBox(height: 6),
                Text('Specialty - Hospital'),
                SizedBox(height: 6),
                Text('4.8 - 2:30 to 5 pm'),
              ],
            ),
          ),
          SizedBox(width: 12),
          Icon(Icons.favorite_border),
        ],
      ),
    );
  }
}
