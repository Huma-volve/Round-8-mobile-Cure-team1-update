part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;
  LoginSuccess({required this.message});
}

class LoginError extends LoginState {
  final String error;

  LoginError({required this.error});
}
