import 'package:cure_team_1_update/features/Home/presentation/pages/search_page.dart';
import 'package:cure_team_1_update/features/Home/presentation/pages/veiw_all_specialties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../location/Data/DataSource/location_datasoucre.dart';
import '../../location/Data/repo/location_repository_impl.dart';
import '../../location/Domin/useCase/get_user_location.dart';
import '../../location/presentation/cubit/location_cubit.dart';
import '../../location/presentation/state/location_state.dart';
import '../widgets/home_top_section.dart';
import '../widgets/specialties_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final dataSource = LocationDataSource();
        final repo = LocationRepositoryImpl(dataSource);
        return LocationCubit(
          GetUserLocation(repo: repo),
          GetUserAddress(repo: repo),
        )..fetchLocationAndAddress();
      },
      child: const _HomePageContent(),
    );
  }
}

class _HomePageContent extends StatelessWidget {
  const _HomePageContent();

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
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SearchPage()));
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
                  onPressed: () {},
                  child: const Text(
                    "Veiw all",
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  )),
            ]),
            BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                if (state is LocationLoading) {
                  return const CircularProgressIndicator();
                } else if (state is LocationAddressLoaded) {
                  return Text(
                      'Lat: ${state.location.lat}, Lng: ${state.location.lng}');
                } else if (state is LocationError) {
                  return Text(state.message);
                }
                return const SizedBox();
              },
            )
          ]),
        ),
      ),
    );
  }
}
