import 'dart:io';

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

T parseDatawithoutlist<T>(
  Map<String, dynamic> response,
  T Function(Map<String, dynamic>) fromJson,
) {
  return fromJson(response);
}

String formatTimeToHourMinute(String time) {
  final dateTime = DateTime.parse(time);

  return DateFormat.jm().format(dateTime);
}
