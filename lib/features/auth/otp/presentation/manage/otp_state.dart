part of 'otp_cubit.dart';

abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {
  final String message;
  OtpSuccess({required this.message});
}

class OtpError extends OtpState {
  final String error;

  OtpError({required this.error});
}
