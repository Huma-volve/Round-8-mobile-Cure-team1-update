import 'dart:async';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_request_body.dart';
import 'package:cure_team_1_update/features/profile/data/models/edit_profile/edit_profile_response.dart';
import 'package:cure_team_1_update/features/profile/data/repos/edit_profile_repo.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';
part 'edit_profile_bloc.freezed.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(this._repo) : super(const EditProfileState.loading()) {
    _hydrateFromCache();
    on<EventEditProfile>(_editProfile);
  }

  final EditProfileRepo _repo;
  bool hasRequested = false;

  // Date selection values
  String? selectedDay;
  String? selectedMonth;
  String? selectedYear;
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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  FutureOr<void> _editProfile(
    EventEditProfile event,
    Emitter<EditProfileState> emit,
  ) async {
    hasRequested = true;
    emit(const EditProfileState.loading());

    final result = await _repo.editProfile(event.data);

    result.when(
      success: (editProfileResponse) {
        final name = editProfileResponse.data.name.trim();
        if (name.isNotEmpty) {
          Cachehelper.cacheUserName(name);
        }
        final email = editProfileResponse.data.email.trim();
        if (email.isNotEmpty) {
          Cachehelper.cacheUserEmail(email);
        }
        final phone = editProfileResponse.data.phone.trim();
        if (phone.isNotEmpty) {
          Cachehelper.cacheUserPhone(phone);
        }
        final birthdate = editProfileResponse.data.birthdate.trim();
        if (birthdate.isNotEmpty) {
          Cachehelper.cacheUserBirthdate(birthdate);
        }
        emit(
            EditProfileState.success(editProfileResponse: editProfileResponse));
      },
      failure: (error) {
        print('Error in EditProfileBloc: $error');
        emit(EditProfileState.error(error: error));
      },
    );
  }

  void _hydrateFromCache() {
    final cachedName = Cachehelper.getUserName();
    if (cachedName != null && cachedName.isNotEmpty) {
      nameController.text = cachedName;
    }
    final cachedEmail = Cachehelper.getUserEmail();
    if (cachedEmail != null && cachedEmail.isNotEmpty) {
      emailController.text = cachedEmail;
    }
    final cachedPhone = Cachehelper.getUserPhone();
    if (cachedPhone != null && cachedPhone.isNotEmpty) {
      phoneController.text = cachedPhone;
    }
    final cachedBirthdate = Cachehelper.getUserBirthdate();
    if (cachedBirthdate != null && cachedBirthdate.isNotEmpty) {
      _setBirthdateFromString(cachedBirthdate);
    }
  }

  void _setBirthdateFromString(String birthdate) {
    final parts = birthdate.split('/');
    if (parts.length != 3) {
      return;
    }
    final day = parts[0].padLeft(2, '0');
    final monthNumber = parts[1].padLeft(2, '0');
    final year = parts[2];
    final monthName = _monthNameFromNumber(monthNumber);
    if (monthName == null) {
      return;
    }
    selectedDay = day;
    selectedMonth = monthName;
    selectedYear = year;
  }

  String? _monthNameFromNumber(String monthNumber) {
    for (final entry in months.entries) {
      if (entry.value == monthNumber) {
        return entry.key;
      }
    }
    return null;
  }
}
