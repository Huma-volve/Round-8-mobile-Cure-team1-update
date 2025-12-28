part of 'signuo_cubit.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final String message;
  SignupSuccess({required this.message});
}

class SignupError extends SignupState {
  final String error;

  SignupError({required this.error});
}
