part of 'chatbody_cubit.dart';

sealed class ChatbodyState extends Equatable {
  const ChatbodyState();
  @override
  List<Object> get props => [];
}

final class ChatbodyInitial extends ChatbodyState {}

final class Lodinghistory extends ChatbodyState {}

final class Successhistory extends ChatbodyState {
  final List<Historymasseges> historymassages;
  const Successhistory(this.historymassages);
}

final class Fuailerhistory extends ChatbodyState {
  final Serverfailuer error;
  const Fuailerhistory(this.error);
}
