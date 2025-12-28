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
  ChatCubit(this.chatrepoa) : super(ChatCubitInitial());
  Future<void> getconv(Chattab tab, {required bool forceRefresh}) async {
    emit(Lodingchat());
    var result = await chatrepoa.featchconversion(tab);
    result.fold((faluir) => emit(Fuailerchat(faluir)),
        (conv) => emit(Successchat(conv)));
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
    var reslut = await chatrepoa.getHistorymassages(conver);
    reslut.fold((faluir) => emit(Fuailerchat(faluir)),
        (conv) => emit(Successchatbody(conv)));
  }

  Future<Conversion?> startConversationWithDoctor({
    required int doctorId,
    required String doctorName,
  }) async {
    Conversion? existing;
    final convResult = await chatrepoa.featchconversion(Chattab.all);
    convResult.fold((_) {}, (conversations) {
      for (final conv in conversations) {
        final other = conv.otherUser;
        if (other?.id == doctorId) {
          existing = conv;
          break;
        }
        if (other?.name?.toLowerCase() == doctorName.toLowerCase()) {
          existing = conv;
          break;
        }
      }
    });
    if (existing != null) {
      return existing;
    }
    final createdResult = await chatrepoa.startConversation(doctorId);
    Conversion? created;
    createdResult.fold((_) {}, (conv) => created = conv);
    if (created != null) {
      await getconv(Chattab.all, forceRefresh: true);
    }
    return created;
  }
}
