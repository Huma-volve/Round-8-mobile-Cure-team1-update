import 'dart:async';

import 'package:cure_team_1_update/core/utils/chattab.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/Favoritesappber.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/chat_search_field.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/customabppar.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/notificationmassage.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chat_cubit/chat_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController controller = TextEditingController();
  Timer? _searchDebounce;
  @override
  void initState() {
    Future.microtask(() {
      context.read<ChatCubit>().getconv(Chattab.all, forceRefresh: true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Customabppar(),
              const SizedBox(height: 16),
              ChatSearchField(
                controller: controller,
                onChanged: _onSearchChanged,
              ),
              const SizedBox(height: 16),
              const Favoritesappber(),
              const SizedBox(height: 12),
             // const Expanded(child: Notificationmassage()),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    _searchDebounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _searchDebounce?.cancel();
    final query = value.trim();
    _searchDebounce = Timer(const Duration(milliseconds: 400), () {
      if (!mounted) {
        return;
      }
      if (query.isEmpty) {
        context.read<ChatCubit>().getconv(Chattab.all, forceRefresh: false);
      } else {
        context.read<ChatCubit>().search(query);
      }
    });
  }
}
