part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatCubitInitial extends ChatState {}

final class Lodingchat extends ChatState {}

final class Successchat extends ChatState {}

final class Fuailerchat extends ChatState {}
