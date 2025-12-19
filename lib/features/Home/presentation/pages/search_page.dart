import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Data/models/specialty_model.dart';
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
              const Text(
                "Search by your location",
                style: TextStyle(fontSize: 17),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "129, El-Nasr Street, Cairo",
                    style: TextStyle(color: Colors.blueAccent),
                  )),
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
                  .toList(),
            ],
          )
        ]),
      ),
    );
  }
}
