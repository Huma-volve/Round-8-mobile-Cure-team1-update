import 'package:bloc/bloc.dart';

import '../../../location/Domin/useCase/get_user_location.dart';
import '../../Data/model/doctor_model.dart';
import '../../Domain/Usecase/doctor_usecase.dart';
import '../state/doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final DoctorUsecase doctorUsecase;
  final GetUserLocation getUserLocation;

  List<DoctorsModel> allDoctors = []; // كل الدكاترة الأصلية
  List<DoctorsModel> nearbyDoctors = []; // القريبين

  DoctorCubit({
    required this.doctorUsecase,
    required this.getUserLocation,
  }) : super(DoctorInitial());

  Future<void> loadDoctor() async {
    try {
      emit(DoctorLoading());

      final location = await getUserLocation();
      allDoctors = await doctorUsecase.repo.getDoctors(); // جيبي كل الدكاترة

      nearbyDoctors = await doctorUsecase(location.lat, location.lng); // القريبين

      emit(DoctorLoaded(nearbyDoctors)); // عرض القريبين في Home
    } catch (e) {
      emit(DoctorError("Failed to load doctors"));
    }
  }

  // دالة جديدة: فلترة بالتخصص من كل الدكاترة
  void filterBySpecialty(int specialtyId) {
    if (allDoctors.isEmpty) {
      emit(DoctorError("الدكاترة لسه بتتحمل"));
      return;
    }

    final filtered = allDoctors.where((doc) => doc.specialty.id == specialtyId).toList();

    emit(DoctorLoaded(filtered));
  }
}