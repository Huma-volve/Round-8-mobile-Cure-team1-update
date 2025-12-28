abstract class UpdateBookingState {}

class UpdateBookingInitialState extends UpdateBookingState {}

class UpdateBookingLoadingState extends UpdateBookingState {}

class UpdateBookingSuccessState extends UpdateBookingState {}

class UpdateBookingFailureState extends UpdateBookingState {
  final String errorMessage;
  UpdateBookingFailureState({required this.errorMessage});
}
