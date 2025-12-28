import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/app_toast.dart';
import 'package:cure_team_1_update/features/Home/Data/models/api_doctor.dart';
import 'package:cure_team_1_update/features/Home/presentation/pages/nav_bar.dart';
import 'package:cure_team_1_update/features/chat/persention/view_modle/chat_cubit/chat_cubit.dart';
import 'package:cure_team_1_update/features/doctor_details/data/models/doctor_reviews.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/models/add_review_args.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/about_me_section.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/add_review_and_rating.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/comment_desplay.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_screen_appbar.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_widget.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/review_and_rating_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DoctorDetailsScreenScrollableContent extends StatefulWidget {
  final ApiDoctor? doctor;
  const DoctorDetailsScreenScrollableContent({
    super.key,
    this.doctor,
  });

  @override
  State<DoctorDetailsScreenScrollableContent> createState() =>
      _DoctorDetailsScreenScrollableContentState();
}

class _DoctorDetailsScreenScrollableContentState
    extends State<DoctorDetailsScreenScrollableContent> {
  bool _isLoadingReviews = false;
  String? _reviewsError;
  List<DoctorReview> _reviews = [];
  double? _averageRating;

  @override
  void initState() {
    super.initState();
    _fetchReviews();
  }

  @override
  void didUpdateWidget(covariant DoctorDetailsScreenScrollableContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.doctor?.id != widget.doctor?.id) {
      _fetchReviews();
    }
  }

  @override
  Widget build(BuildContext context) {
    final reviewsCount = _reviewsError != null ||
            (_isLoadingReviews && _reviews.isEmpty)
        ? null
        : _reviews.length;
    final ratingValue = _averageRating ?? widget.doctor?.rating;
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
                DoctorDetailsWidget(doctor: widget.doctor),
                SizedBox(
                  height: 20.r,
                ),
                ReviewAndRatingSection(
                  experienceYears: widget.doctor?.experienceYears,
                  rating: ratingValue,
                  reviewsCount: reviewsCount,
                ),
                SizedBox(
                  height: 28.r,
                ),
                AboutMeSection(aboutMe: widget.doctor?.aboutMe),
                SizedBox(
                  height: 24.r,
                ),
                AddReviewAndRating(
                  rating: ratingValue,
                  reviewsCount: reviewsCount,
                  onAddReview: () => _openAddReview(context),
                ),
                SizedBox(
                  height: 24.r,
                ),
                _buildReviewsSection(),
                SizedBox(height: 150.r),
              ],
            ),
          ],
        ));
  }

  Widget _buildReviewsSection() {
    if (_isLoadingReviews) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.r),
        child: const Center(child: CircularProgressIndicator()),
      );
    }
    if (_reviewsError != null) {
      return Text(
        _reviewsError!,
        style: AppTextStyles.montserratMedum16(context),
      );
    }
    if (_reviews.isEmpty) {
      return Text(
        'No reviews yet.',
        style: AppTextStyles.montserratMedum16(context),
      );
    }
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _reviews.length,
      itemBuilder: (context, index) {
        return CommentDesplay(review: _reviews[index]);
      },
      separatorBuilder: (context, index) => SizedBox(height: 12.r),
    );
  }

  Future<void> _startChat(BuildContext context) async {
    final doctor = widget.doctor;
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

  Future<void> _openAddReview(BuildContext context) async {
    final doctor = widget.doctor;
    if (doctor == null || doctor.id == 0) {
      AppToast.show(context, 'Doctor data is missing.');
      return;
    }
    final result = await context.push(
      AppRoute.addReviewScreen,
      extra: AddReviewArgs(doctorId: doctor.id),
    );
    if (result == true) {
      _fetchReviews();
    }
  }

  Future<void> _fetchReviews() async {
    final doctorId = widget.doctor?.id;
    if (doctorId == null || doctorId == 0) {
      setState(() {
        _reviewsError = 'Doctor data is missing.';
        _reviews = [];
        _isLoadingReviews = false;
        _averageRating = null;
      });
      return;
    }

    setState(() {
      _isLoadingReviews = true;
      _reviewsError = null;
    });

    try {
      final api = getIt<ApiServices>();
      final response = await api.get('reviews/doctor/$doctorId');
      if (response is! Map<String, dynamic>) {
        throw Exception('Invalid response');
      }
      final parsed = DoctorReviewsResponse.fromJson(response);
      if (!mounted) return;
      setState(() {
        _reviews = parsed.reviews;
        _averageRating = parsed.doctor?.averageRating;
        _isLoadingReviews = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _reviewsError = 'Failed to load reviews.';
        _reviews = [];
        _isLoadingReviews = false;
      });
    }
  }
}
