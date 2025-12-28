import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:cure_team_1_update/core/utils/assets.dart';
import 'package:cure_team_1_update/features/Booking/domain/entites/my_booking_entity.dart';
import 'package:cure_team_1_update/features/Booking/domain/enums/booking_enum.dart';
import 'package:cure_team_1_update/features/Booking/domain/enums/payment_status_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MyBookingItemHeader extends StatelessWidget {
  const MyBookingItemHeader({
    super.key, required this.booking,
  });
  final MyBookingEntity booking;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Assets.resourceImagesCalendar02,
          color: ColorsLight.blueGray,
          height: 16.r,
          width: 16.r,
        ),
        SizedBox(width: 6.w),
        Expanded(
          child: Text(
            _formatBookingDateTime(
              booking.bookDate,
              booking.bookHour,
            ),
            style: AppTextStyles.montserratRegular12(context)
                .copyWith(color: ColorsLight.blueGray),
          ),
        ),
        Text(
          _statusLabel(booking),
          style: AppTextStyles.montserratRegular12(context)
              .copyWith(color: _statusColor(booking)),
        )
      ],
    );
  }
  
}

String _statusLabel(MyBookingEntity booking) {
  if (booking.bookingStatus == BookingEnum.cancelled) {
    return 'Cancelled';
  }
  if (booking.bookingStatus == BookingEnum.completed) {
    return 'Completed';
  }
  if (booking.paymentStatus == PaymentStatus.unpaid) {
    return 'Unpaid';
  }
  return 'Upcoming';
}

Color _statusColor(MyBookingEntity booking) {
  if (booking.bookingStatus == BookingEnum.cancelled) {
    return ColorsLight.red;
  }
  if (booking.bookingStatus == BookingEnum.completed) {
    return ColorsLight.green;
  }
  if (booking.paymentStatus == PaymentStatus.unpaid) {
    return const Color(0xFFF59E0B);
  }
  return ColorsLight.royalBlue;
}

String _formatBookingDateTime(String date, String time) {
  final dateText = _formatDate(date);
  final timeText = _formatTime(time);
  if (dateText.isNotEmpty && timeText.isNotEmpty) {
    return '$dateText - $timeText';
  }
  if (dateText.isNotEmpty) {
    return dateText;
  }
  if (timeText.isNotEmpty) {
    return timeText;
  }
  return 'Appointment';
}

String _formatDate(String raw) {
  if (raw.trim().isEmpty) {
    return '';
  }
  final parsed = DateTime.tryParse(raw);
  if (parsed != null) {
    return DateFormat('EEEE, MMMM d').format(parsed);
  }
  return raw;
}

String _formatTime(String raw) {
  if (raw.trim().isEmpty) {
    return '';
  }
  try {
    final parsed = DateFormat('h:mm a').parse(raw);
    return DateFormat('h:mm a').format(parsed);
  } catch (_) {
    try {
      final parsed = DateFormat('HH:mm').parse(raw);
      return DateFormat('h:mm a').format(parsed);
    } catch (_) {
      try {
        final parsed = DateFormat('HH:mm:ss').parse(raw);
        return DateFormat('h:mm a').format(parsed);
      } catch (_) {
        return raw;
      }
    }
  }
}
