abstract class CreateBookState {}
class CreateBookintialState extends CreateBookState{}
class CreateBookLoadingState extends CreateBookState{}
class CreateBookSuccessState extends CreateBookState{
  final int bookingId;
  CreateBookSuccessState({required this.bookingId});
}
class CreateBookFailureState extends CreateBookState{
  final String errorMessage;
  CreateBookFailureState({required this.errorMessage});
}
