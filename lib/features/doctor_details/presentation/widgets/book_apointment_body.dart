import 'package:cure_team_1_update/core/constants/app_route.dart';
import 'package:cure_team_1_update/core/services/service_locator.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_screen_body_bloc_builder.dart';
import 'package:cure_team_1_update/features/Home/Data/models/api_doctor.dart';
import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/doctor_details/data/models/doctor_availability.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/create_book_manger/cubit/create_book_cubit.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/create_book_manger/cubit/create_book_state.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/models/booking_flow_data.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/book_apointment_scrollable_content.dart';
import 'package:cure_team_1_update/features/doctor_details/presentation/widgets/price_and_action_footer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cure_team_1_update/core/services/shared_pref/shared_pref.dart';
import 'package:intl/intl.dart';

class BookApointmentBody extends StatefulWidget {
  final ApiDoctor? doctor;
  const BookApointmentBody({
    super.key,
    this.doctor,
  });

  @override
  State<BookApointmentBody> createState() => _BookApointmentBodyState();
}

class _BookApointmentBodyState extends State<BookApointmentBody> {
  String? appointmentTime;

  String? appointmentDate;
  bool _isLoadingAvailability = false;
  String? _availabilityError;
  final List<DoctorAvailabilitySlot> _availabilitySlots = [];
  final Map<String, List<DoctorAvailabilitySlot>> _slotsByDate = {};
  final Set<String> _availableDates = {};
  List<String> _availableTimes = [];

  @override
  void initState() {
    super.initState();
    _loadAvailability();
  }

  @override
  void didUpdateWidget(covariant BookApointmentBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.doctor?.id != widget.doctor?.id) {
      appointmentDate = null;
      appointmentTime = null;
      _availableTimes = [];
      _availableDates.clear();
      _availabilitySlots.clear();
      _slotsByDate.clear();
      _loadAvailability();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BookAppointementScrollableContent(
          doctor: widget.doctor,
          onSelectBookTime: (selectedTime) {
            setState(() {
              appointmentTime = selectedTime;
            });
          },
          onSelectedBookData: (selectedDate) {
            setState(() {
              appointmentDate = selectedDate;
              _updateAvailableTimes(selectedDate);
            });
          },
          availableDates: _availableDates,
          availableTimes: _availableTimes,
          isLoadingAvailability: _isLoadingAvailability,
          availabilityError: _availabilityError,
          initialSelectedDate: appointmentDate,
          initialSelectedTime: appointmentTime,
        ),
        BlocConsumer<CreateBookCubit, CreateBookState>(
          listener: (context, state) {
            if (state is CreateBookSuccessState) {
              if (widget.doctor != null) {
                context.push(
                  AppRoute.selectPaymentMethodScreen,
                  extra: BookingFlowData(
                    doctor: widget.doctor!,
                    bookingId: state.bookingId,
                    appointmentDate: appointmentDate,
                    appointmentTime: appointmentTime,
                  ),
                );
              } else {
                messageForUser(
                    context: context, errorMessage: 'Doctor data is missing.');
              }
            } else if (state is CreateBookFailureState) {
              messageForUser(
                  context: context, errorMessage: state.errorMessage);
            }
          },
          builder: (context, state) {
            return PriceAndBookActionFooterButton(
                loadingState: state is CreateBookLoadingState ? true : false,
                buttonName: 'Continue to Pay',
                price: widget.doctor?.sessionPrice,
                onPressed: () {
                  if (widget.doctor == null || widget.doctor!.id == 0) {
                    messageForUser(
                        context: context,
                        errorMessage: 'Doctor data is missing.');
                    return;
                  }
                  final token = Cachehelper.getToken();
                  if (token == null || token.isEmpty) {
                    messageForUser(
                        context: context,
                        errorMessage: 'Please log in to book an appointment.');
                    return;
                  }
                  if (appointmentDate != null && appointmentTime == null) {
                    messageForUser(
                        context: context,
                        errorMessage: 'please select appointment time');
                  } else if (appointmentDate != null &&
                      appointmentTime != null) {
                    context.read<CreateBookCubit>().create(
                        doctorId: widget.doctor!.id,
                        appointmentDate: appointmentDate!,
                        appointmentTime: appointmentTime!);
                  } else {
                    messageForUser(
                        context: context,
                        errorMessage: 'please select appointment date');
                  }
                });
          },
        )
      ],
    );
  }

  Future<void> _loadAvailability() async {
    final doctorId = widget.doctor?.id ?? 0;
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
      _slotsByDate..clear();
      for (final slot in _availabilitySlots) {
        _slotsByDate.putIfAbsent(slot.date, () => []).add(slot);
      }
      _availableDates
        ..clear()
        ..addAll(_slotsByDate.keys);
      if (_availableDates.isNotEmpty) {
        final sortedDates = _availableDates.toList()..sort();
        final date = appointmentDate ?? sortedDates.first;
        appointmentDate = date;
        _updateAvailableTimes(date);
      } else {
        _availableTimes = [];
        appointmentDate = null;
        appointmentTime = null;
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
        !_availableTimes
            .any((time) => time.toLowerCase() == currentLabel.toLowerCase())) {
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
