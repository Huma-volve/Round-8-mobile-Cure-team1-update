import 'package:flutter/material.dart';

import '../../Data/models/api_doctor.dart';
import '../state/favorite_store.dart';
import '../widgets/api_doctor_item.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});
  @override
  Widget build(BuildContext context) {
    FavoriteStore.ensureSynced();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your favorite"),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: ValueListenableBuilder<List<ApiDoctor>>(
        valueListenable: FavoriteStore.favoriteDoctors,
        builder: (context, doctors, child) {
          if (doctors.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Group 7 (1).png"),
                  const Text(
                    "Your favorite!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text("Add your favorite doctor to find it easy")
                ],
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: doctors.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 12);
            },
            itemBuilder: (context, index) {
              return ApiDoctorItem(doctor: doctors[index]);
            },
          );
        },
      ),
    );
  }
}
