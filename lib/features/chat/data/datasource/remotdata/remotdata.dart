// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cure_team_1_update/core/function/helperfunction.dart';
import 'package:cure_team_1_update/core/utils/chattab.dart';

import 'package:cure_team_1_update/core/services/api_services.dart';
import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:dio/dio.dart';

abstract class Remotdata {
  Future<List<Conversion>> featchconversion(Chattab tab);
  Future<List<Conversion>> searchconversion(convName);
  Future<List<Historymasseges>> getHistorymassages(Conversion conv);
  Future<List<Historymasseges>> sendmassages(
      int conversionId, Object data);
  Future<Conversion> startConversation(int doctorId);
}

class immplementRemotdata extends Remotdata {
  final ApiServices apiServices;
  immplementRemotdata(
    this.apiServices,
  );
  List<Historymasseges> messages = [];
  @override
  Future<List<Conversion>> featchconversion(tab) async {
    String endpoint = _endpointbytab(tab);
    var repons = await apiServices.get(endpoint);
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
  Future<List<Historymasseges>> getHistorymassages(conve) async {
    var respons = await apiServices.get("conversations/${conve.id}");
    print('mmmmmmmmmmmmmmmmmmm$respons');
    messages.clear();
    messages
        .addAll(parseData<Historymasseges>(respons, Historymasseges.fromJson));
    return Future.value(messages);
  }

  @override
  Future<List<Historymasseges>> sendmassages(conversionId, data) async {
    print('beforrrrrrrrrrrrrrrr');
    if (data is FormData) {
      await apiServices.postFormData(
        "conversations/$conversionId/messages",
        data,
      );
    } else {
      await apiServices.post("conversations/$conversionId/messages", data);
    }

    return Future.value(messages);
  }

  @override
  Future<Conversion> startConversation(int doctorId) async {
    final response = await apiServices.post(
      'conversations/start',
      {'doctor_id': doctorId},
    );
    return Conversion.fromJson(_extractConversation(response));
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

Map<String, dynamic> _extractConversation(dynamic response) {
  if (response is Map<String, dynamic>) {
    final data = response['data'];
    if (data is Map<String, dynamic>) {
      return data;
    }
    if (data is List && data.isNotEmpty) {
      final first = data.first;
      if (first is Map<String, dynamic>) {
        return first;
      }
    }
    return response;
  }
  return <String, dynamic>{};
}
