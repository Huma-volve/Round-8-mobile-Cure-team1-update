import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/utils/app_toast.dart';
import 'package:cure_team_1_update/features/Home/Data/models/api_doctor.dart';
import 'package:cure_team_1_update/features/Home/presentation/pages/nav_bar.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chat_cubit/chat_cubit.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/about_me_section.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/add_review_and_rating.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/comment_desplay.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_screen_appbar.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_widget.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/review_and_rating_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DoctorDetailsScreenScrollableContent extends StatelessWidget {
  final ApiDoctor? doctor;
  const DoctorDetailsScreenScrollableContent({
    super.key,
    this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.r,
                ),
                DoctorDetailsAppBar(
                  title: 'Doctor Details',
                  ismessageIconEnable: true,
                  onMessageTap: () => _startChat(context),
                ),
                SizedBox(
                  height: 20.r,
                ),
                DoctorDetailsWidget(doctor: doctor),
                SizedBox(
                  height: 20.r,
                ),
                ReviewAndRatingSection(
                  experienceYears: doctor?.experienceYears,
                  rating: doctor?.rating,
                ),
                SizedBox(
                  height: 28.r,
                ),
                AboutMeSection(aboutMe: doctor?.aboutMe),
                SizedBox(
                  height: 24.r,
                ),
                const AddReviewAndRating(),
                SizedBox(
                  height: 24.r,
                ),
                const CommentDesplay(),
                SizedBox(height: 150.r),
              ],
            ),
          ],
        ));
  }

  Future<void> _startChat(BuildContext context) async {
    final doctor = this.doctor;
    if (doctor == null || doctor.id == 0) {
      AppToast.show(context, 'Doctor data is missing.');
      return;
    }
    final chatCubit = getIt.get<ChatCubit>();
    final conversation = await chatCubit.startConversationWithDoctor(
      doctorId: doctor.id,
      doctorName: doctor.name,
    );
    if (!context.mounted) {
      return;
    }
    if (conversation == null) {
      AppToast.show(context, 'Unable to start chat. Try again.');
      return;
    }
    context.go(
      AppRoute.navBar,
      extra: NavBarArgs(index: 2, conversation: conversation),
    );
  }
}
