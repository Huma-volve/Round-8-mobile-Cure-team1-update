import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/auth/login/data/repo/login_repo.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  final formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  Future<void> logUser() async {
    if (formKey.currentState?.validate() != true) return;
    emit(LoginLoading());

    final result = await loginRepo.loginUSer(
      phoneNumber: phoneController.text.trim(),
      password: passwordController.text.trim(),
    );

    result.fold(
      (failure) {
        emit(LoginError(error: failure.errormessage));
      },
      (loginModel) async {
        final token = loginModel.token ?? loginModel.data?.token;
        if (token != null && token.isNotEmpty) {
          await Cachehelper.cacheToken(token);
        }
        final userData = loginModel.data;
        final name = userData?.name;
        if (name != null && name.isNotEmpty) {
          await Cachehelper.cacheUserName(name);
        }
        final email = userData?.email;
        if (email != null && email.isNotEmpty) {
          await Cachehelper.cacheUserEmail(email);
        }
        final phone = userData?.phone;
        if (phone != null && phone.isNotEmpty) {
          await Cachehelper.cacheUserPhone(phone);
        }
        if (name == null || name.isEmpty) {
          await _fetchAndCacheProfile();
        }
        emit(LoginSuccess(message: loginModel.message ?? ''));
      },
    );
  }

  Future<void> _fetchAndCacheProfile() async {
    try {
      final api = getIt<ApiServices>();
      final response = await api.get('profile/show');
      final data = _extractProfileData(response);
      if (data == null) {
        return;
      }
      final fetchedName = data['name'];
      if (fetchedName is String && fetchedName.trim().isNotEmpty) {
        await Cachehelper.cacheUserName(fetchedName.trim());
      }
      final fetchedEmail = data['email'];
      if (fetchedEmail is String && fetchedEmail.trim().isNotEmpty) {
        await Cachehelper.cacheUserEmail(fetchedEmail.trim());
      }
      final fetchedPhone = data['phone'];
      if (fetchedPhone is String && fetchedPhone.trim().isNotEmpty) {
        await Cachehelper.cacheUserPhone(fetchedPhone.trim());
      }
      final birthdate = data['birthdate'];
      final normalizedBirthdate =
          _readBirthdate(birthdate, extraData: data['extra_data']);
      if (normalizedBirthdate != null && normalizedBirthdate.isNotEmpty) {
        await Cachehelper.cacheUserBirthdate(normalizedBirthdate);
      }
    } catch (_) {
      // ignore profile fetch failures
    }
  }

  Map<String, dynamic>? _extractProfileData(dynamic response) {
    if (response is Map<String, dynamic>) {
      final data = response['data'];
      if (data is Map<String, dynamic>) {
        return data;
      }
      final user = response['user'];
      if (user is Map<String, dynamic>) {
        return user;
      }
      final profile = response['profile'];
      if (profile is Map<String, dynamic>) {
        return profile;
      }
    }
    return null;
  }

  String? _readBirthdate(dynamic value, {dynamic extraData}) {
    if (value is String && value.trim().isNotEmpty) {
      return value.trim();
    }
    if (extraData is Map<String, dynamic>) {
      final birthdate = extraData['birthdate'];
      if (birthdate is Map<String, dynamic>) {
        final day = birthdate['Day'] ?? birthdate['day'];
        final month = birthdate['Month'] ?? birthdate['month'];
        final year = birthdate['Year'] ?? birthdate['year'];
        if (day != null && month != null && year != null) {
          return '$day/$month/$year';
        }
      }
    }
    return null;
  }

  @override
  Future<void> close() {
    phoneController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
