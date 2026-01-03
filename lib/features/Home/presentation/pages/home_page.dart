import 'package:cure_team_1_update/features/Home/presentation/pages/search_page.dart';
import 'package:cure_team_1_update/features/Home/presentation/pages/veiw_all_specialties.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../Data/models/api_doctor.dart';
import '../../location/Domin/entities/user_location.dart';
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

class _HomePageContent extends StatefulWidget {
  const _HomePageContent();

  @override
  State<_HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<_HomePageContent> {
  bool _isLoading = false;
  String? _error;
  List<ApiDoctor> _doctors = [];

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
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 27),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const HomeTopSection(),
            const SizedBox(
              height: 23,
            ),
            TextFormField(
              readOnly: true,
              onTap: () {
                final locationCubit = context.read<LocationCubit>();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: locationCubit,
                      child: const SearchPage(),
                    ),
                  ),
                );
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
            SizedBox(
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
                  onPressed: () {
                    final state = context.read<LocationCubit>().state;
                    final doctors = state is LocationAddressLoaded
                        ? _nearbyDoctors(state.location, _doctors)
                        : _doctors;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DoctorsListPage(
                          title: 'Doctors near you',
                          doctors: doctors,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    "View all",
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  )),
            ]),
            BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                if (_isLoading || state is LocationLoading) {
                  return const _DoctorSkeletonList();
                }
                if (_error != null) {
                  return Text(_error!);
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
