import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/app_toast.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/models/add_review_args.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/custom_text_fild.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/doctor_details_screen_appbar.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/rating_with_star.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/send_your_review_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddReviewScreenBody extends StatefulWidget {
  const AddReviewScreenBody({
    super.key,
    this.args,
  });

  final AddReviewArgs? args;

  @override
  State<AddReviewScreenBody> createState() => _AddReviewScreenBodyState();
}

class _AddReviewScreenBodyState extends State<AddReviewScreenBody> {
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _bookingIdController = TextEditingController();
  int _rating = 0;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    final bookingId = widget.args?.bookingId;
    if (bookingId != null && bookingId > 0) {
      _bookingIdController.text = bookingId.toString();
    }
  }

  @override
  void dispose() {
    _commentController.dispose();
    _bookingIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ratingLabel = _rating > 0 ? '$_rating/5' : '--/5';
    final showBookingIdField =
        widget.args?.bookingId == null || widget.args!.bookingId! <= 0;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.h,
            ),
            const DoctorDetailsAppBar(
              title: 'Review',
              ismessageIconEnable: false,
            ),
            SizedBox(
              height: 24.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Rate',
                      style: AppTextStyles.georgiaRegular16(context),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        RatingWithStar(
                          rating: _rating,
                          onChanged: (value) {
                            setState(() {
                              _rating = value;
                            });
                          },
                        ),
                        const Spacer(),
                        Text(
                          ratingLabel,
                          style: AppTextStyles.georgiaRegular40(context),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    if (showBookingIdField) ...[
                      Text(
                        'Booking ID',
                        style: AppTextStyles.georgiaRegular16(context),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      TextField(
                        controller: _bookingIdController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Enter booking ID',
                          hintStyle: AppTextStyles.montserratMedum14(context),
                          border: buildOutlineInputBorder(),
                          enabledBorder: buildOutlineInputBorder(),
                          focusedBorder: buildOutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 14.w,
                            vertical: 12.h,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                    ],
                    Text(
                      'Your review',
                      style: AppTextStyles.georgiaRegular20(context),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    CustomTextFild(
                      controller: _commentController,
                      maxLines: 6,
                      hintText: 'Write your review',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            SendYourReviewButton(
              isLoading: _isSubmitting,
              onPressed: _isSubmitting ? null : () => _submitReview(context),
            ),
            SizedBox(
              height: 12.h,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitReview(BuildContext context) async {
    final bookingId =
        widget.args?.bookingId ?? int.tryParse(_bookingIdController.text.trim());
    if (bookingId == null || bookingId <= 0) {
      AppToast.show(context, 'Enter a valid booking ID.');
      return;
    }
    if (_rating <= 0) {
      AppToast.show(context, 'Select a rating.');
      return;
    }
    final comment = _commentController.text.trim();
    if (comment.isEmpty) {
      AppToast.show(context, 'Write your review.');
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      final api = getIt<ApiServices>();
      final form = FormData.fromMap({
        'booking_id': bookingId,
        'rating': _rating,
        'comment': comment,
      });
      final response = await api.postFormData('reviews', form);
      if (!mounted) return;
      String message = 'Review submitted successfully.';
      if (response is Map<String, dynamic>) {
        final responseMessage = response['message'];
        if (responseMessage is String && responseMessage.isNotEmpty) {
          message = responseMessage;
        }
      }
      AppToast.show(context, message);
      context.pop(true);
    } catch (error) {
      if (!mounted) return;
      AppToast.show(context, _extractSubmitError(error));
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }
}

String _extractSubmitError(Object error) {
  if (error is DioException) {
    final data = error.response?.data;
    if (data is Map<String, dynamic>) {
      final message = data['message'];
      if (message is String && message.trim().isNotEmpty) {
        return message;
      }
      final errors = data['errors'];
      if (errors is Map<String, dynamic>) {
        final first = errors.values.cast().expand((value) {
          if (value is List) {
            return value.whereType<String>();
          }
          if (value is String) {
            return [value];
          }
          return const Iterable<String>.empty();
        }).firstWhere(
          (value) => value.trim().isNotEmpty,
          orElse: () => '',
        );
        if (first.trim().isNotEmpty) {
          return first;
        }
      }
    }
  }
  return 'Failed to submit review. Try again.';
}
