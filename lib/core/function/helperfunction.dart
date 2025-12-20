import 'dart:io';

import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';

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

List<Conversion> parsingdata(Map<String, dynamic> respos) {
  List<Conversion> conversions = [];
  for (var item in respos['items']) {
    conversions.add(Conversion.fromJson(item));
  }
  return conversions;
}
