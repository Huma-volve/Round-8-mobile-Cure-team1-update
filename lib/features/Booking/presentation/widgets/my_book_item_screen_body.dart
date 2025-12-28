

import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/Booking/domain/repo/my_book_repo.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/doctor_details/data/models/doctor_availability.dart';
import 'package:cure_team_1_update/features/Booking/presentation/manager/update_book/cubit/update_booking_cubit.dart';
import 'package:cure_team_1_update/features/Booking/presentation/manager/update_book/cubit/update_booking_state.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/appoint_ment_warning.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_book_appbar.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_screen_body_bloc_builder.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/your_appointment_date_and_doctor_details.dart';
import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

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
  bool _isLoadingAvailability = false;
  String? _availabilityError;
  final List<DoctorAvailabilitySlot> _availabilitySlots = [];
  final Map<String, List<DoctorAvailabilitySlot>> _slotsByDate = {};
  final Set<String> _availableDates = {};
  List<String> _availableTimes = [];

  @override
  void initState() {
    super.initState();
    appointmentDate = widget.booking.bookDate;
    appointmentTime = widget.booking.bookHour;
    _loadAvailability();
  }

  void _onDateSelected(String date) {
    setState(() {
      appointmentDate = date;
      _updateAvailableTimes(date);
    });
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
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child: Column(
                children: [
                  SizedBox(
                    height: 8.r,
                  ),
                  const MyBookAppbar(title: 'Your Appointment'),
                  SizedBox(
                    height: 24.r,
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
                      selectedDate: appointmentDate,
                      selectedTime: appointmentTime,
                      availableDates: _availableDates,
                      availableTimes: _availableTimes,
                      isAvailabilityLoading: _isLoadingAvailability,
                      availabilityError: _availabilityError,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48.h),
                        backgroundColor: ColorsLight.royalBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      onPressed:
                          isLoading ? null : () => _updateBooking(context),
                      child: isLoading
                          ? const SizedBox(
                              height: 18,
                              width: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(
                              'Reschedule',
                              style: AppTextStyles.montserratMedum16(context)
                                  .copyWith(color: Colors.white),
                            ),
                    ),
                  ),
                  SizedBox(height: 12.r),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(double.infinity, 48.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        side: const BorderSide(
                          color: ColorsLight.borderButton,
                        ),
                        foregroundColor: ColorsLight.blueGray,
                      ),
                      onPressed: isLoading
                          ? null
                          : () => Navigator.of(context).maybePop(),
                      child: Text(
                        'Cancel',
                        style: AppTextStyles.montserratMedum16(context)
                            .copyWith(color: ColorsLight.blueGray),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.r),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  Future<void> _loadAvailability() async {
    final doctorId = widget.booking.docId;
    if (doctorId == 0) {
      setState(() {
        _availabilityError = 'Doctor data is missing.';
      });
      return;
    }
    setState(() {
      _isLoadingAvailability = true;
      _availabilityError = null;
    });
    try {
      final api = getIt<ApiServices>();
      final response = await api.get('doctors/$doctorId/availability');
      if (response is! Map<String, dynamic>) {
        throw Exception('Invalid response');
      }
      final parsed = DoctorAvailabilityResponse.fromJson(response);
      if (!parsed.success) {
        throw Exception(parsed.message ?? 'Failed to load availability.');
      }
      _availabilitySlots
        ..clear()
        ..addAll(parsed.slots.where((slot) => slot.date.isNotEmpty));
      _slotsByDate
        ..clear();
      for (final slot in _availabilitySlots) {
        _slotsByDate.putIfAbsent(slot.date, () => []).add(slot);
      }
      _availableDates
        ..clear()
        ..addAll(_slotsByDate.keys);
      if (_availableDates.isNotEmpty) {
        final sortedDates = _availableDates.toList()..sort();
        final date =
            appointmentDate != null && _availableDates.contains(appointmentDate)
                ? appointmentDate
                : sortedDates.first;
        appointmentDate = date;
        _updateAvailableTimes(date);
      } else {
        _availableTimes = [];
      }
    } catch (_) {
      _availabilityError = 'Failed to load availability.';
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingAvailability = false;
        });
      }
    }
  }

  void _updateAvailableTimes(String? date) {
    if (date == null || date.isEmpty) {
      _availableTimes = [];
      appointmentTime = null;
      return;
    }
    final slots = _slotsByDate[date] ?? [];
    slots.sort((a, b) => _compareTimes(a.startTime, b.startTime));
    _availableTimes = slots
        .map((slot) => _formatTimeLabel(slot.startTime))
        .where((value) => value.isNotEmpty)
        .toList();
    if (_availableTimes.isEmpty) {
      appointmentTime = null;
      return;
    }
    final currentLabel = _formatTimeLabel(appointmentTime);
    if (appointmentTime == null ||
        !_availableTimes.any(
            (time) => time.toLowerCase() == currentLabel.toLowerCase())) {
      appointmentTime = _normalizeApiTime(slots.first.startTime);
    }
  }
}

int _compareTimes(String a, String b) {
  final first = _parseTime(a);
  final second = _parseTime(b);
  if (first == null || second == null) {
    return a.compareTo(b);
  }
  return first.compareTo(second);
}

String _formatTimeLabel(String? raw) {
  if (raw == null || raw.trim().isEmpty) {
    return '';
  }
  final parsed = _parseTime(raw);
  if (parsed == null) {
    return raw;
  }
  return DateFormat('h:mm a').format(parsed);
}

String _normalizeApiTime(String raw) {
  final parsed = _parseTime(raw);
  if (parsed == null) {
    return raw;
  }
  return DateFormat('HH:mm').format(parsed);
}

DateTime? _parseTime(String raw) {
  final trimmed = raw.trim();
  final formats = ['HH:mm', 'H:mm', 'HH:mm:ss', 'H:mm:ss'];
  for (final format in formats) {
    try {
      return DateFormat(format).parse(trimmed);
    } catch (_) {}
  }
  return null;
}
