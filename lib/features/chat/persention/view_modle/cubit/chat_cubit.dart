import 'package:bloc/bloc.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ApiServices api;
  ChatCubit(this.api) : super(ChatCubitInitial()) {
    test();
  }
  Future<void> test() async {
    print('-------------------nds--');

    await Cachehelper.cacheToken(
        '64|7IPYzTIIOR9jilzZf2rrzRBU8BRULcADARxYK0hs949d7601');
    var respon = await getit<ApiServices>().get('conversations');
    print('00000000${respon}');
  }
}
