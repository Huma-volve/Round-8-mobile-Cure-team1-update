import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:cure_team_1_update/features/chat/domain/repo/chatrepo.dart';

import 'package:equatable/equatable.dart';

part 'chatbody_state.dart';

class ChatbodyCubit extends Cubit<ChatbodyState> {
  Chatrepoa chatrepoa;
  ChatbodyCubit(this.chatrepoa) : super(ChatbodyInitial());

  Future<void> getmassages(Conversion convers) async {
    print('chatbodydtaild chatbodydtailds');
    emit(Lodinghistory());
    var reslut = await chatrepoa.getHistorymassages(convers);
    print('chatbodydtaild chatbodydtailds $reslut');
    reslut.fold((faluir) => emit(Fuailerhistory(faluir)),
        (conv) => emit(Successhistory(conv)));
  }

  sentmessage() {}
}
