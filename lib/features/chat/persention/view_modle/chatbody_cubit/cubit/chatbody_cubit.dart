import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatbody_state.dart';

class ChatbodyCubit extends Cubit<ChatbodyState> {
  ChatbodyCubit() : super(ChatCubitInitial());
}
