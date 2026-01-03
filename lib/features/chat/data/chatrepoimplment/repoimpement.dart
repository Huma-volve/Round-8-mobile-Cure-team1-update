import 'package:cure_team_1_update/core/error/failures.dart';
import 'package:cure_team_1_update/core/utils/chattab.dart';

import 'package:cure_team_1_update/features/chat/data/datasource/remotdata/remotdata.dart';
import 'package:cure_team_1_update/features/chat/data/modle/conversion/conversion/conversion.dart';
import 'package:cure_team_1_update/features/chat/data/modle/historymasseges/historymasseges.dart';
import 'package:cure_team_1_update/features/chat/domain/repo/chatrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class Repoimplement extends Chatrepoa {
  Remotdata remotdata;
  Repoimplement(this.remotdata);
  List<Conversion> conv = [];

  @override
  Future<Either<Serverfailuer, List<Conversion>>> featchconversion(
      Chattab tab) async {
    try {
      conv = await remotdata.featchconversion(tab);
      return right(conv);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailuer.forDioExcption(e));
      } else {
        return left(Serverfailuer(e.toString()));
      }
    }
  }

  @override
  Future<Either<Serverfailuer, List<Conversion>>> searchconversion(
      convName) async {
    try {
      conv = await remotdata.searchconversion(convName);
      return right(conv);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailuer.forDioExcption(e));
      } else {
        return left(Serverfailuer(e.toString()));
      }
    }
  }

  @override
  Future<Either<Serverfailuer, List<Historymasseges>>> getHistorymassages(
      conver) async {
    try {
      var massa = await remotdata.getHistorymassages(conver);
      return right(massa);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailuer.forDioExcption(e));
      } else {
        return left(Serverfailuer(e.toString()));
      }
    }
  }

  @override
  Future<Either<Serverfailuer, List<Historymasseges>>> sendmassages(
      conversionId, data) async {
    try {
      var respons = await remotdata.sendmassages(conversionId, data);
      return right(respons);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailuer.forDioExcption(e));
      } else {
        return left(Serverfailuer(e.toString()));
      }
    }
  }

  @override
  Future<Either<Serverfailuer, Conversion>> startConversation(
      int doctorId) async {
    try {
      final conversation = await remotdata.startConversation(doctorId);
      return right(conversation);
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailuer.forDioExcption(e));
      } else {
        return left(Serverfailuer(e.toString()));
      }
    }
  }

  @override
  Future<Either<Serverfailuer, List<Conversion>>> refreshConversations(
      Chattab tab) {
    // TODO: implement refreshConversations
    throw UnimplementedError();
  }
}
