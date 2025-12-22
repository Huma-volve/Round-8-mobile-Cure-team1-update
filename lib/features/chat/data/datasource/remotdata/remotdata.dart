// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cure_team_1_update/core/function/helperfunction.dart';
import 'package:cure_team_1_update/core/utils/chattab.dart';

import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';

abstract class Remotdata {
  Future<List<Conversion>> featchconversion(Chattab tab);
  Future<List<Conversion>> searchconversion(convName);
  Future<List<Historymasseges>> getHistorymassages(int id);
}

class immplementRemotdata extends Remotdata {
  final ApiServices apiServices;
  immplementRemotdata(
    this.apiServices,
  );
  @override
  Future<List<Conversion>> featchconversion(tab) async {
    String endpoint = _endpointbytab(tab);
    var repons = await apiServices.get(endpoint);
    print('---------------------all data');
    List<Conversion> conv = parseData<Conversion>(repons, Conversion.fromJson);
    return Future.value(conv);
  }

  @override
  Future<List<Conversion>> searchconversion(convName) async {
    var respons = await apiServices.get("conversations?search=$convName");
    List<Conversion> conv = parseData<Conversion>(respons, Conversion.fromJson);
    return Future.value(conv);
  }

  @override
  Future<List<Historymasseges>> getHistorymassages(int id) async {
    var respons = await apiServices.get("conversations/$id");
    List<Historymasseges> massages =
        parseData<Historymasseges>(respons, Historymasseges.fromJson);
    return Future.value(massages);
  }
}

String _endpointbytab(Chattab tab) {
  switch (tab) {
    case Chattab.favorites:
      return 'conversations?type=favorites';
    case Chattab.unread:
      return 'conversations?type=unread';
    default:
      return 'conversations';
  }
}
