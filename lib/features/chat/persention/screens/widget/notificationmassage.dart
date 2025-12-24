
import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/chat/data/chatrepoimplment/repoimpement.dart';
import 'package:cure_team_1_update/features/chat/data/modle/prfiledatils.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/histroychat.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chatbody_cubit/cubit/chatbody_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets.dart';
import '../../view_modle/chat_cubit/chat_cubit.dart';
import '../chatbody.dart';

class Notificationmassage extends StatelessWidget {
  const Notificationmassage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Prfiledatils> allList = [
      Prfiledatils(Assets.resourceImagesJana, 'It’s been around six.....',
          'Dr,jana', '4:05'),
      Prfiledatils(Assets.resourceImagesJessica, 'It’s been around six.....',
          'Dr,Jessica', '4:05'),
      Prfiledatils(Assets.resourceImagesRobert, 'you: ok i will do it like...',
          'Dr,Robert', '4:05'),
      Prfiledatils(Assets.resourceImagesJana, 'It’s been around six.....',
          'Dr,jana', '4:05'),
      Prfiledatils(Assets.resourceImagesJessica, 'It’s been around six.....',
          'Dr,Jessica', '4:05'),
      Prfiledatils(Assets.resourceImagesRobert, 'you: ok i will do it like...',
          'Dr,Robert', '4:05')
    ];

    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is Lodingchat) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is Successchat) {
          if (state.conversionlist.isEmpty) {
            return const Center(
              child: Text('No conversations yet'),
            );
          }

          return ListView.builder(

              itemCount: state.conversionlist.length,
              itemBuilder: (context, indx) => Histroychat(
                    massage: state.conversionlist[indx],
                    fun: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (_) =>
                                ChatbodyCubit(getIt.get<Repoimplement>())
                                  ..getmassages(state.conversionlist[indx]),
                            child:
                                Chatbody(convers: state.conversionlist[indx]),
                          ),
                        ),
                      );
                    },
                  ));
        }

        if (state is Fuailerchat) {
          return Center(
            child: Text(state.error.errormessage),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
