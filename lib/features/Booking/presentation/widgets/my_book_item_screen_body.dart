

import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/Booking/domain/repo/my_book_repo.dart';
import 'package:cure_team_1_update/features/Booking/presentation/manager/update_book/cubit/update_booking_cubit.dart';
import 'package:cure_team_1_update/features/Booking/presentation/manager/update_book/cubit/update_booking_state.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/appoint_ment_warning.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_book_appbar.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_screen_body_bloc_builder.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/your_appointment_date_and_doctor_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateMyBookingScreenBody extends StatefulWidget {
  const UpdateMyBookingScreenBody({super.key, required this.booking});
  final MyBookingEntity booking;

  @override
  State<UpdateMyBookingScreenBody> createState() =>
      _UpdateMyBookingScreenBodyState();
}

class _UpdateMyBookingScreenBodyState extends State<UpdateMyBookingScreenBody> {
  String? appointmentDate;
  String? appointmentTime;

  @override
  void initState() {
    super.initState();
    appointmentDate = widget.booking.bookDate;
    appointmentTime = widget.booking.bookHour;
  }

  void _onDateSelected(String date) {
    appointmentDate = date;
  }

  void _onTimeSelected(String time) {
    appointmentTime = time;
  }

  Future<void> _updateBooking(BuildContext context) async {
    final date = appointmentDate;
    final time = appointmentTime;
    if (date == null || date.isEmpty) {
      messageForUser(context: context, errorMessage: 'Select appointment date');
      return;
    }
    if (time == null || time.isEmpty) {
      messageForUser(context: context, errorMessage: 'Select appointment time');
      return;
    }
    context.read<UpdateBookingCubit>().updateBooking(
          bookId: widget.booking.bookId,
          appointmentDate: date,
          appointmentTime: time,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UpdateBookingCubit(myBookRepo: getIt<MyBookRepo>()),
      child: BlocConsumer<UpdateBookingCubit, UpdateBookingState>(
        listener: (context, state) {
          if (state is UpdateBookingSuccessState) {
            messageForUser(
                context: context, errorMessage: 'Booking updated successfully.');
            Navigator.pop(context);
          } else if (state is UpdateBookingFailureState) {
            messageForUser(
                context: context, errorMessage: state.errorMessage);
          }
        },
        builder: (context, state) {
          final isLoading = state is UpdateBookingLoadingState;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.r),
            child: Column(
              children: [
                SizedBox(
                  height: 24.r,
                ),
                const MyBookAppbar(title: 'Your Appointment'),
                SizedBox(
                  height: 40.r,
                ),
                const AppointmentWarning(),
                SizedBox(
                  height: 24.r,
                ),
                Expanded(
                  child: YourAppointmentDateAndDoctorDetails(
                    booking: widget.booking,
                    onDateSelected: _onDateSelected,
                    onTimeSelected: _onTimeSelected,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        isLoading ? null : () => _updateBooking(context),
                    child: isLoading
                        ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Reschedule'),
                  ),
                ),
                SizedBox(height: 16.r),
              ],
            ),
          );
        },
      ),
    );
  }
}
