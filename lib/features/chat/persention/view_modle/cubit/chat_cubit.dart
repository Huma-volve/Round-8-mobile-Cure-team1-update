import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:cure_team_1_update/core/utils/chattab.dart';
import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/domain/repo/chatrepo.dart';

import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  Chatrepoa chatrepoa;
  ChatCubit(this.chatrepoa) : super(ChatCubitInitial()) {
    getconv(Chattab.all);
  }
  Future<void> getconv(Chattab tab) async {
    await Cachehelper.cacheToken(
        "114|7gYvlIpcUGx69fE0a39r0pLtzEmheETZnWkwwtCxf4d4a0d9");
    emit(Lodingchat());
    var result = await chatrepoa.featchconversion(tab);
    result.fold((faluir) => emit(Fuailerchat(faluir)),
        (conv) => emit(Successchat(conv)));
  }
}
