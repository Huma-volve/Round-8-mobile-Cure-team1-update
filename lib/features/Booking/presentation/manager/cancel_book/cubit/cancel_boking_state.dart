abstract class CancelMyBookingState {}
class CancelMyBookingintialState extends CancelMyBookingState{}
class CancelMyBookingLoadingState extends CancelMyBookingState{}
class CancelMyBookingFailureState extends CancelMyBookingState{
  
  CancelMyBookingFailureState({required this.errorMessage});
  final String errorMessage;
}
class CancelMyBookingSuccessState extends CancelMyBookingState{}