import 'dart:async';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_request_body.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_response.dart';
import 'package:cure_team_1_update/features/profile/data/repos/edit_profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';
part 'edit_profile_bloc.freezed.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(this._repo) : super(const EditProfileState.loading()) {
    on<EventEditProfile>(_editProfile);
  }

  final EditProfileRepo _repo;

  // Date selection values
  String? selectedDay = '01';
  String? selectedMonth = 'July';
  String? selectedYear = '2002';
  // Generate lists for dropdowns
  List<String> get days => List.generate(31, (index) => (index + 1).toString());

  final Map<String, String> months = {
    'January': '01',
    'February': '02',
    'March': '03',
    'April': '04',
    'May': '05',
    'June': '06',
    'July': '07',
    'August': '08',
    'September': '09',
    'October': '10',
    'November': '11',
    'December': '12',
  };
  String getFormattedBirthDate({
    required String day,
    required String month,
    required String year,
  }) {
    final formattedDay = day.padLeft(2, '0'); // 1 → 01
    final formattedMonth = months[month]!; // July → 07

    return '$formattedDay/$formattedMonth/$year';
  }

  // Generate years from 1950 to current year
  List<String> get years => List.generate(
        DateTime.now().year - 1950 + 1,
        (index) => (1950 + index).toString(),
      ).reversed.toList();

  TextEditingController nameController =
      TextEditingController(text: 'Seif Mohamed');
  TextEditingController emailController = TextEditingController(
    text: 'seif_mohamed@Example.com',
  );
  TextEditingController phoneController =
      TextEditingController(text: '+20 123 456 7890');

  final formKey = GlobalKey<FormState>();

  FutureOr<void> _editProfile(
    EventEditProfile event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(const EditProfileState.loading());
    print('lllllllllllllllllll ');

    final result = await _repo.editProfile(event.data);
    print('sssssssssssssssss');

    result.when(
      success: (editProfileResponse) {
        print('Edit profile successful: $editProfileResponse');
        emit(
            EditProfileState.success(editProfileResponse: editProfileResponse));
      },
      failure: (error) {
        print('Error in EditProfileBloc: $error');
        emit(EditProfileState.error(error: error));
      },
    );
  }
}
