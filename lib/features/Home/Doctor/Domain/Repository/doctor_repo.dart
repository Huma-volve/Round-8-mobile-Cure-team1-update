import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/features/Home/Doctor/Data/remoteData/doctor_remote_source_data.dart';

import '../../Data/model/doctor_model.dart';

abstract class DoctorRepo {
  Future<List<DoctorsModel>> getDoctors();
  Future<List<DoctorsModel>> getDoctorsBySpecialty(int specialtyId);


}
