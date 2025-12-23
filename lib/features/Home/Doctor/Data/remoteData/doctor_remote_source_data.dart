import 'package:cure_team_1_update/core/services/api_services.dart';

import '../model/doctor_model.dart';
class DoctorRemoteSourceData {
  final ApiServices apiServices;
  DoctorRemoteSourceData({required this.apiServices});

   Future<List<DoctorsModel>> getDoctors() async {
    final response = await apiServices.get("doctors"); // response JSON كامل
    final List<dynamic> dataList = response['data']; // هنا ناخد بس array جوا "data"
    return dataList.map((e) => DoctorsModel.fromJson(e)).toList();
  }
  Future<List<DoctorsModel>> getDoctorsBySpecialty(int specialtyId) async {
    final response = await apiServices.get(
      "doctors?specialty_id=$specialtyId",
    );

    final List data = response['data'];
    print("CALLING API WITH specialty_id = $specialtyId");


    return data.map((e) => DoctorsModel.fromJson(e)).toList();
  }
}
