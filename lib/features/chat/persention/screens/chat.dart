import 'dart:async';

import 'package:cure_team_1_update/core/common/widgets/custome_text_field.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';

import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/core/utils/chattab.dart';

import 'package:cure_team_1_update/features/chat/persention/screens/widget/Favoritesappber.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/customabppar.dart';

import 'package:cure_team_1_update/features/chat/persention/screens/widget/notificationmassage.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chat_cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController controller = TextEditingController();
  final FocusNode _focus = FocusNode();
  List<String> searchHistory = ["robert", "jessica"];
  bool isslected = false;
  Timer? _searchDebounce;
  @override
  void initState() {
    _focus.addListener(() {
      setState(() {
        isslected = _focus.hasFocus;
      });
    });
    Future.microtask(() {
      context.read<ChatCubit>();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Customabppar(),
            const SizedBox(
              height: 20,
            ),
            CustomeTextField(
              focusnode: _focus,
              perfixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  Assets.resourceImagesMagnifer,
                ),
              ),
              text: 'Search for chat, doctor',
              function: (value) {
                _onSearchChanged(value);
              },
              controller: controller,
            ),
            const SizedBox(
              height: 20,
            ),
            ...(isslected)
                ? [
                    Text(
                      'history',
                      style: AppTextStyles.stylegeorgia27(context),
                    ),
                    const SizedBox(height: 20),
                  ]
                : [const Favoritesappber()],
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: Notificationmassage())
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    _focus.dispose();
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
        context.read<ChatCubit>().getconv(Chattab.all);
      } else {
        context.read<ChatCubit>().search(query);
      }
    });
  }
}
