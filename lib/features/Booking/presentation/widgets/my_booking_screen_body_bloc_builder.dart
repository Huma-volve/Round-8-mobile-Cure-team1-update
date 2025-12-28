import 'package:cure_team_1_update/core/utils/app_toast.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/Booking/presentation/manager/get_book/cubit/booking_cubit.dart';
import 'package:cure_team_1_update/features/Booking/presentation/manager/get_book/cubit/booking_state.dart';
import 'package:cure_team_1_update/features/Booking/presentation/widgets/my_booking_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MyBookingScreenBodyBlocConsumer extends StatelessWidget {
  final DateTime? selectedDate;
  const MyBookingScreenBodyBlocConsumer({super.key, this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return    BlocConsumer<BookingCubit,BookingState>(
      
      listener: (context, state) {
        if(state is BookingFailureState)
        {
          messageForUser(context: context, errorMessage: state.errorMessege);
        }
      },
      builder: (context, state) {
        if (state is BookingSuccessState) {
          final visibleBookings = _filterByDate(
            state.myBooks,
            selectedDate,
          );
          if (visibleBookings.isEmpty) {
            return const Expanded(
              child: Center(
                child: Text('No bookings for this day.'),
              ),
            );
          }
          return Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: visibleBookings.length,
              itemBuilder: (context, index) =>
                  MyBookingItem(mybookItem: visibleBookings[index]),
              separatorBuilder: (_, __) => const SizedBox(height: 16),
            ),
          );
        }
        return const Expanded(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
    
    
    
      
  }
}

void messageForUser(
    {required BuildContext context, required String errorMessage}) {
  AppToast.show(context, errorMessage);
}

List<MyBookingEntity> _filterByDate(
    List<MyBookingEntity> bookings, DateTime? selectedDate) {
  if (selectedDate == null) {
    return bookings;
  }
  return bookings.where((booking) {
    final bookingDate = _parseBookingDate(booking.bookDate);
    if (bookingDate == null) {
      return false;
    }
    return DateUtils.isSameDay(bookingDate, selectedDate);
  }).toList();
}

DateTime? _parseBookingDate(String raw) {
  final trimmed = raw.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  final parsed = DateTime.tryParse(trimmed);
  if (parsed != null) {
    return parsed;
  }
  try {
    return DateFormat('yyyy-MM-dd').parseStrict(trimmed);
  } catch (_) {}
  try {
    return DateFormat('yyyy-MM-dd HH:mm:ss').parseStrict(trimmed);
  } catch (_) {}
  return null;
}
