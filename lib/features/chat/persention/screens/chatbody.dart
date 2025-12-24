import 'package:cure_team_1_update/core/common/widgets/custome_text_field.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/abpperchatbody.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/chatmassges.dart';


import 'package:cure_team_1_update/features/chat/persention/view_modle/chatbody_cubit/cubit/chatbody_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Chatbody extends StatefulWidget {
  const Chatbody({super.key, required this.convers});
  final Conversion convers;
  @override
  State<Chatbody> createState() => _ChatbodyState();
}

class _ChatbodyState extends State<Chatbody> {
  final TextEditingController controller = TextEditingController();

  final ScrollController scroll = ScrollController();
  @override
  void dispose() {
    controller.dispose();
    scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<ChatbodyCubit, ChatbodyState>(
          builder: (context, state) {
            if (state is Lodinghistory) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Abpperchatbody(convers: widget.convers),
                    Expanded(
                      child: _ChatMessagesSkeleton(
                        scroll: scroll,
                      ),
                    ),
                    _buildInputBar(),
                  ],
                ),
              );
            } else if (state is Fuailerhistory) {
              return Center(
                child: Text(state.error.errormessage),
              );
            } else if (state is Successhistory) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Abpperchatbody(convers: widget.convers),
                    Expanded(
                        child: Chatmassges(
                          list: state.historymassages,
                          scroll: scroll,
                          otherUserId: widget.convers.otherUser?.id,
                        )),
                    _buildInputBar(),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }

  Widget _buildInputBar() {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: CustomeTextField(
              text: 'Message',
              suffixIcon: SizedBox(
                width: 60.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(Assets.resourceImagesPaperclip),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(Assets.resourceImagesCamera),
                  ],
                ),
              ),
              onfieldsumitted: (value) {
                controller.clear();
                scroll.animateTo(0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.ease);
              },
              controller: controller),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 52.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff145DB8)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Center(child: SvgPicture.asset(Assets.resourceImagesMic)),
            ),
          ),
        )
      ],
    );
  }
}

class _ChatMessagesSkeleton extends StatelessWidget {
  const _ChatMessagesSkeleton({required this.scroll});

  final ScrollController scroll;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        controller: scroll,
        itemCount: 8,
        itemBuilder: (context, index) {
          final alignRight = index.isEven;
          return Align(
            alignment:
                alignRight ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              width: alignRight ? 220 : 180,
              decoration: BoxDecoration(
                color: alignRight
                    ? const Color(0xff145DB8)
                    : const Color(0xffBBC1C7),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text(
                'Loading message',
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
