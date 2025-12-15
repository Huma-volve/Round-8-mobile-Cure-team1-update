import 'package:cure_team_1_update/core/common/widgets/custome_text_field.dart';
import 'package:cure_team_1_update/core/extensions/context_extension.dart';
import 'package:cure_team_1_update/core/style/responsive_size.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';

import 'package:cure_team_1_update/features/chat/persention/screens/widget/bubble_freind.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/bubble_text.dart';
import 'package:cure_team_1_update/features/chat/persention/screens/widget/imageprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Chatbody extends StatefulWidget {
  const Chatbody({super.key});

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: SvgPicture.asset(
                        Assets.resourceImagesBackarrow,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Imageprofile(image: Assets.resourceImagesJana),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Dr. Robert',
                      style: AppTextStyles.styleLarge20(context).copyWith(
                          fontSize: responsive_size(context, fontsize: 20)),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Spacer(),
                    SvgPicture.asset(Assets.resourceImagesVideocamera),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(Assets.resourceImagesCall),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(Assets.resourceImagesDot),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Expanded(child: ListView()),
              Row(
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
                      controller: TextEditingController(),
                    ),
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
                        child: Center(
                            child: SvgPicture.asset(Assets.resourceImagesMic)),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
