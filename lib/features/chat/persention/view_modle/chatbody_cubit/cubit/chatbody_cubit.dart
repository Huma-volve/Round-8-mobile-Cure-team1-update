import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:cure_team_1_update/features/chat/domain/repo/chatrepo.dart';

import 'package:equatable/equatable.dart';

part 'chatbody_state.dart';

class ChatbodyCubit extends Cubit<ChatbodyState> {
  Chatrepoa chatrepoa;
  int _requestId = 0;
  ChatbodyCubit(this.chatrepoa) : super(ChatbodyInitial());

  Future<void> getmassages(Conversion convers) async {
    final requestId = ++_requestId;
    final cached = chatrepoa.getCachedMessages(convers.id);
    final hasCache = cached != null && cached.isNotEmpty;
    if (hasCache) {
      emit(Successhistory(List<Historymasseges>.from(cached)));
    } else {
      emit(Lodinghistory());
    }
    var reslut = await chatrepoa.getHistorymassages(convers);
    if (requestId != _requestId) {
      return;
    }
    reslut.fold((faluir) {
      if (!hasCache) {
        emit(Fuailerhistory(faluir));
      }
    }, (conv) => emit(Successhistory(conv)));
  }

  sentmessage() {}
}
