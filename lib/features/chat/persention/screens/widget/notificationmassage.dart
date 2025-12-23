import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/chat/data/chatrepoimplment/repoimpement.dart';
import 'package:cure_team_1_update/features/chat/data/modle/prfiledatils.dart';
import 'package:cure_team_1_update/features/chat/domain/repo/chatrepo.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/chatbody.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/histroychat.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chat_cubit/chat_cubit.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chatbody_cubit/cubit/chatbody_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Notificationmassage extends StatelessWidget {
  const Notificationmassage({super.key});

  @override
  Widget build(BuildContext context) {
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
                                ChatbodyCubit(getit.get<Repoimplement>())
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
