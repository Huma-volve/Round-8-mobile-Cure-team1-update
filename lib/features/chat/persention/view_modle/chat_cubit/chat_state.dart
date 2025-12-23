part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();
  @override
  List<Object> get props => [];
}

final class ChatCubitInitial extends ChatState {}

final class Lodingchat extends ChatState {}

final class Successchat extends ChatState {
  final List<Conversion> conversionlist;
  const Successchat(this.conversionlist);
}

final class Successchatbody extends ChatState {
  final List<Historymasseges> conversionlist;
  const Successchatbody(this.conversionlist);
}

final class Fuailerchat extends ChatState {
  final Serverfailuer error;
  const Fuailerchat(this.error);
}
