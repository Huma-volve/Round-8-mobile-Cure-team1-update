import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/features/Home/presentation/pages/search_page.dart';
import 'package:cure_team_1_update/features/Home/presentation/pages/veiw_all_specialties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/assets.dart';
import '../../Data/models/doctor_model.dart';
import '../../Doctor/Presentation/cubit/doctor_cubit.dart';
import '../../Doctor/Presentation/state/doctor_state.dart';
import '../../location/presentation/cubit/location_cubit.dart';
import '../../location/presentation/state/location_state.dart';
import '../widgets/doctor_item.dart';
import '../widgets/home_top_section.dart';
import '../widgets/specialties_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<LocationCubit>().fetchLocationAndAddress();
  }

  @override
  Widget build(BuildContext context) {
    context.read<LocationCubit>().fetchLocationAndAddress();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 27),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const HomeTopSection(),
            const SizedBox(
              height: 23,
            ),
            TextFormField(
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
                          return SizedBox(
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
