import 'package:cure_team_1_update/core/function/helperfunction.dart';

String safeChatTime(String? value) {
  if (value == null || value.isEmpty) {
    return '--';
  }
  final parsed = DateTime.tryParse(value);
  if (parsed == null) {
    return '--';
  }
  return formatTimeToHourMinute(value);
}
