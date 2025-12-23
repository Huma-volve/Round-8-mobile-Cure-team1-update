import '../../Domain/Repository/doctor_repo.dart';
import '../model/doctor_model.dart';
import 'doctor_remote_source_data.dart';

class DoctorRepoImpl implements DoctorRepo {
  final DoctorRemoteSourceData remote;

  DoctorRepoImpl({required this.remote});

  @override
  Future<List<DoctorsModel>> getDoctors() {
    return remote.getDoctors();
  }
  @override
  Future<List<DoctorsModel>> getDoctorsBySpecialty(int specialtyId) async {
    return await remote.getDoctorsBySpecialty(specialtyId);
  }
}
