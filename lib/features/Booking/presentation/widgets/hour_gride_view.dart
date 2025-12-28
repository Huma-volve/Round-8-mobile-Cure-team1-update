import 'package:cure_team_1_update/features/Booking/presentation/widgets/hour_gride_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HourGrideView extends StatefulWidget {
  final String? initialTime;
  final ValueChanged<String>? onTimeSelected;
  const HourGrideView({super.key, this.initialTime, this.onTimeSelected});

  @override
  State<HourGrideView> createState() => _HourGrideViewState();
}

class _HourGrideViewState extends State<HourGrideView> {
  late String selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = _resolveInitialTime(widget.initialTime);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: allTimes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 105.r / 40.r,
            crossAxisCount: 3,
            mainAxisSpacing: 16.r,
            crossAxisSpacing: 40.r),
        itemBuilder: (context, index) {
          final time = allTimes[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedTime = time;
              });
              widget.onTimeSelected?.call(_formatForApi(time));
            },
            child: HourGrideViewItem(
              time: time,
              selectedTime: selectedTime,
            ),
          );
        });
  }
}

String _resolveInitialTime(String? raw) {
  if (raw == null || raw.isEmpty) {
    return allTimes.first;
  }
  final trimmed = raw.trim();
  final directMatch = allTimes.firstWhere(
    (time) => time.toLowerCase() == trimmed.toLowerCase(),
    orElse: () => '',
  );
  if (directMatch.isNotEmpty) {
    return directMatch;
  }
  final parsed = _parseApiTime(trimmed);
  if (parsed != null) {
    final formatted = DateFormat('h:mm a').format(parsed);
    final match = allTimes.firstWhere(
      (time) => time.toLowerCase() == formatted.toLowerCase(),
      orElse: () => '',
    );
    if (match.isNotEmpty) {
      return match;
    }
  }
  return allTimes.first;
}

String _formatForApi(String time) {
  try {
    final parsed = DateFormat('h:mm a').parse(time);
    return DateFormat('HH:mm').format(parsed);
  } catch (_) {
    return time;
  }
}

DateTime? _parseApiTime(String raw) {
  try {
    return DateFormat('HH:mm').parse(raw);
  } catch (_) {
    try {
      return DateFormat('HH:mm:ss').parse(raw);
    } catch (_) {
      return null;
    }
  }
}

List<String> allTimes = [
  '9:00 AM',
  '10:00 AM',
  '11:00 AM',
  '12:30 AM',
  '4:00 PM',
  '5:30 PM',
  '7:00 PM',
  '9:00 PM',
  '10:00 PM'
];
