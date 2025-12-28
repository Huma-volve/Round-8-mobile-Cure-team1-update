import 'package:cure_team_1_update/core/utils/chattab.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favoritesappber extends StatefulWidget {
  const Favoritesappber({super.key});

  @override
  State<Favoritesappber> createState() => _FavoritesappberState();
}

class _FavoritesappberState extends State<Favoritesappber> {
  final List<String> buttoms = ['All', 'Unread', 'Favorites'];
  int current_indx = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: List.generate(buttoms.length, (index) {
        final selected = current_indx == index;
        return InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            setState(() {
              current_indx = index;
            });
            if (index == 1) {
              context.read<ChatCubit>().getconv(
                    Chattab.unread,
                    forceRefresh: true,
                  );
            } else if (index == 2) {
              context.read<ChatCubit>().getconv(
                    Chattab.favorites,
                    forceRefresh: true,
                  );
            } else {
              context.read<ChatCubit>().getconv(
                    Chattab.all,
                    forceRefresh: true,
                  );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: selected ? const Color(0xff145DB8) : Colors.transparent,
              border: Border.all(
                color: selected ? Colors.transparent : const Color(0xFFE5E7EB),
              ),
            ),
            child: Text(
              buttoms[index],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
                fontSize: 14,
                color:
                    selected ? Colors.white : const Color(0xff99A2AB),
              ),
            ),
          ),
        );
      }),
    );
  }
}
