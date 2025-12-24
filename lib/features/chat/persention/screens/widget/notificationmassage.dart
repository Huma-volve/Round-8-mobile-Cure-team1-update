import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/chat/data/chatrepoimplment/repoimpement.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/chatbody.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/histroychat.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chat_cubit/chat_cubit.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chatbody_cubit/cubit/chatbody_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Notificationmassage extends StatelessWidget {
  const Notificationmassage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is Lodingchat) {
          return const _ChatListSkeleton();
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

class _ChatListSkeleton extends StatelessWidget {
  const _ChatListSkeleton();

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF6F7F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const ListTile(
              leading: CircleAvatar(radius: 24),
              title: Text('Loading name'),
              subtitle: Text('Loading message preview'),
              trailing: Text('00:00'),
            ),
          );
        },
      ),
    );
  }
}
