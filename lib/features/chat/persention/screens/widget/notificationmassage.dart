import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/chat/data/modle/prfiledatils.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/chatbody.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/histroychat.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Notificationmassage extends StatelessWidget {
  const Notificationmassage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Prfiledatils> all_list = [
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
    return ListView.builder(
        itemCount: all_list.length,
        itemBuilder: (context, indx) => InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Chatbody()));
            },
            child: Histroychat(massage: all_list[indx])));
  }
}
