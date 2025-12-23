
import 'package:cure_team_1_update/features/Home/Doctor/Data/model/doctor_model.dart';

abstract class DoctorState {}

class DoctorInitial extends DoctorState {}
class DoctorLoaded extends DoctorState {
  final List<DoctorsModel> doctors;
  DoctorLoaded(this.doctors);}

class DoctorLoading extends DoctorState {}



class DoctorError extends DoctorState {
  final String message ;
  DoctorError(this.message);
}
