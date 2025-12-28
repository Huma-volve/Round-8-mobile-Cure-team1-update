import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/chat_image_source_sheet.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/chatbody_actions.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/chatbody_layout.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chatbody_cubit/cubit/chatbody_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chatbody extends StatefulWidget {
  const Chatbody({super.key, required this.convers});
  final Conversion convers;

  @override
  State<Chatbody> createState() => _ChatbodyState();
}

class _ChatbodyState extends State<Chatbody> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scroll = ScrollController();
  late final ChatbodyActions _actions;

  @override
  void initState() {
    super.initState();
    _actions = ChatbodyActions();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<ChatbodyCubit, ChatbodyState>(
        builder: (context, state) {
          if (state is Lodinghistory) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is Fuailerhistory) {
            return Center(child: Text(state.error.errormessage));
          }
          if (state is Successhistory) {
            return ChatbodyLayout(
              convers: widget.convers,
              messages: state.historymassages,
              scroll: _scroll,
              controller: _controller,
              onSend: () =>
                  _actions.sendText(context, widget.convers, _controller, _scroll),
              onAttach: () =>
                  _actions.pickFile(context, widget.convers, _controller, _scroll),
              onCamera: () => showChatImageSourceSheet(
                context,
                onCamera: () => _actions.pickCamera(
                  context,
                  widget.convers,
                  _controller,
                  _scroll,
                ),
                onGallery: () => _actions.pickGallery(
                  context,
                  widget.convers,
                  _controller,
                  _scroll,
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
