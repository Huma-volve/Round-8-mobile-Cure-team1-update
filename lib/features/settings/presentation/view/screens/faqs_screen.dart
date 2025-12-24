import 'package:cure_team_1_update/core/common/widgets/custom_app_bar.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/features/settings/presentation/view_model/faqs_bloc/faqs_bloc.dart';

import 'package:cure_team_1_update/features/settings/presentation/view/widgets/fAQ_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getit<FaqsBloc>()..add(const EventFaqs()),
      child: Scaffold(
        backgroundColor: ColorsLight.scaffoldBackground,
        appBar: CustomAppBar(
          title: 'FAQs',
          onPressed: () {
            Navigator.pop(context);
            GoRouter.of(context).canPop() ? GoRouter.of(context).pop() : null;
          },
        ),
        body: BlocConsumer<FaqsBloc, FaqsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () {
                print('loading....');
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: CircularProgressIndicator(),
                  ),
                );
              },
              success: (faqsResponse) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      final faq = faqsResponse.data[index];
                      return FAQExpansionTile(
                        title: faq.question.en,
                        content: faq.answer.en,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16.h);
                    },
                    itemCount: faqsResponse.data.length);
              },
              orElse: () {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: CircularProgressIndicator(
                    color: ColorsLight.error,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  // Widget _buildExpansionTile(int index, String title, String content) {
  //   bool isExpanded = index == 0;
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: ColorsLight.inputFill,
  //       borderRadius: BorderRadius.circular(12.r),
  //     ),
  //     child: Theme(
  //       data: ThemeData().copyWith(dividerColor: Colors.transparent),
  //       child: ExpansionTile(
  //         title: Text(title, style: StyleTextHelper.styleLarge8),
  //         initiallyExpanded: isExpanded,
  //         trailing: isExpanded
  //             ? SvgPicture.asset(
  //                 Assets.settingsMinusSign,
  //                 width: 12.w,
  //                 height: 12.w,
  //                 colorFilter: const ColorFilter.mode(
  //                   ColorsLight.textMain,
  //                   BlendMode.srcIn,
  //                 ),
  //               )
  //             : SvgPicture.asset(
  //                 Assets.paymentIcOutlinePaypal,
  //                 width: 12.w,
  //                 height: 12.w,
  //                 colorFilter: const ColorFilter.mode(
  //                   ColorsLight.textMain,
  //                   BlendMode.srcIn,
  //                 ),
  //               ),
  //         childrenPadding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 10.h),
  //         children: [
  //           Divider(),
  //           Text(content, style: StyleTextHelper.styleSmall6)
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
