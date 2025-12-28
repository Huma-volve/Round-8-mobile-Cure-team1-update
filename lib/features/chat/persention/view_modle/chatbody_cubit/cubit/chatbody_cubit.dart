import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/core/error/failures.dart';

import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:cure_team_1_update/features/chat/domain/repo/chatrepo.dart';

import 'package:equatable/equatable.dart';

part 'chatbody_state.dart';

class ChatbodyCubit extends Cubit<ChatbodyState> {
  Chatrepoa chatrepoa;
  Timer? _timer;
  ChatbodyCubit(this.chatrepoa) : super(ChatbodyInitial());
  void startPolling(Conversion conv) async {
    getmassages(conv);

    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (_) => getmassages(conv),
    );
  }

  Future<void> getmassages(Conversion conver) async {
    var reslut = await chatrepoa.getHistorymassages(conver);
    print('chatbodydtaild chatbodydtailds $reslut');
    reslut.fold((faluir) => emit(Fuailerhistory(faluir)), (conv) {
      final List<Historymasseges> messages = conv.cast<Historymasseges>();
      emit(Successhistory(messages));
    });
  }

  Future<void> sendmassge(int conversionId, Object data) async {
    print('chatbodydtaild chatbodydtailds');

    var reslut = await chatrepoa.sendmassages(conversionId, data);
    print('chatbodydtaild chatbodydtailds $reslut');
    reslut.fold((faluir) => emit(Fuailerhistory(faluir)),
        (conv) => emit(Successhistory(List<Historymasseges>.from(conv))));
  }
}
