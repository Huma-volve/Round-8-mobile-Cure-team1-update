
import 'package:cure_team_1_update/features/Home/presentation/pages/search_page.dart';
import 'package:cure_team_1_update/features/Home/presentation/pages/veiw_all_specialties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/assets.dart';
import '../../Data/models/doctor_model.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 27),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopSection(),
              const SizedBox(
                height: 23,
              ),
              TextFormField(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
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
               SizedBox(
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
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    final item = doctorsList[index];
                    return DoctorItem(doctor: item);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 12,
                    );
                  },
                  itemCount: doctorsList.length,
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
