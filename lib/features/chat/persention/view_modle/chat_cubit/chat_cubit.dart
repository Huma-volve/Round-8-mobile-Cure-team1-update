import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/core/utils/chattab.dart';
import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:cure_team_1_update/features/chat/domain/repo/chatrepo.dart';

import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  Chatrepoa chatrepoa;
  int _requestId = 0;
  ChatCubit(this.chatrepoa) : super(ChatCubitInitial()) {
    getconv(Chattab.all);
  }
  Future<void> getconv(Chattab tab) async {
    final requestId = ++_requestId;
    final cached = chatrepoa.getCachedConversations(tab);
    final hasCache = cached != null && cached.isNotEmpty;
    if (hasCache) {
      emit(Successchat(List<Conversion>.from(cached)));
    } else {
      emit(Lodingchat());
    }
    var result = await chatrepoa.featchconversion(tab);
    if (requestId != _requestId) {
      return;
    }
    result.fold((faluir) {
      if (!hasCache) {
        emit(Fuailerchat(faluir));
      }
    }, (conv) => emit(Successchat(conv)));
  }

  Future<void> search(String nameconv) async {
    final requestId = ++_requestId;
    emit(Lodingchat());
    var resalt = await chatrepoa.searchconversion(nameconv);
    if (requestId != _requestId) {
      return;
    }
    resalt.fold((faluir) => emit(Fuailerchat(faluir)),
        (conv) => emit(Successchat(conv)));
  }

  Future<void> getmassages(Conversion conver) async {
    emit(Lodingchat());
    var reslut = await chatrepoa.getHistorymassages(conver);
    reslut.fold((faluir) => emit(Fuailerchat(faluir)),
        (conv) => emit(Successchatbody(conv)));
  }
}
