import 'dart:io';

import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:intl/intl.dart';

checkinternet() async {
  try {
    var reslt = await InternetAddress.lookup('google.com');
    if (reslt.isNotEmpty && reslt[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException {
    return false;
  }
}

List<T> parseData<T>(
  Map<String, dynamic> response,
  T Function(Map<String, dynamic>) fromJson,
) {
  return (response['data'] as List).map((item) => fromJson(item)).toList();
}

String formatTimeToHourMinute(String time) {
  final dateTime = DateTime.parse(time);

  return DateFormat.jm().format(dateTime);
}
