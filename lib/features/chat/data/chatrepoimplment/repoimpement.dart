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
  List<Historymasseges> massa = [];
  final Map<Chattab, List<Conversion>> _conversationsCache = {};
  final Map<int, List<Historymasseges>> _messagesCache = {};
  @override
  Future<Either<Serverfailuer, List<Conversion>>> featchconversion(
      Chattab tab) async {
    try {
      conv = await _retryOnTimeout(() => remotdata.featchconversion(tab));
      final cached = _conversationsCache[tab];
      if (conv.isEmpty && cached != null && cached.isNotEmpty) {
        return right(cached);
      }
      _conversationsCache[tab] = conv;
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
  Future<Either<Serverfailuer, List<Conversion>>> refreshConversations(
      Chattab tab) async {
    try {
      conv = await _retryOnTimeout(() => remotdata.featchconversion(tab));
      _conversationsCache[tab] = conv;
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
      conv = await _retryOnTimeout(() => remotdata.searchconversion(convName));
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
      Conversion conver) async {
    try {
      massa = await _retryOnTimeout(() => remotdata.getHistorymassages(conver));
      _messagesCache[conver.id] = massa;
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
  List<Conversion>? getCachedConversations(Chattab tab) {
    return _conversationsCache[tab];
  }

  @override
  List<Historymasseges>? getCachedMessages(int conversationId) {
    return _messagesCache[conversationId];
  }

  Future<T> _retryOnTimeout<T>(Future<T> Function() action) async {
    try {
      return await action();
    } on DioException catch (error) {
      if (_isTimeout(error)) {
        return await action();
      }
      rethrow;
    }
  }

  bool _isTimeout(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout;
  }
}
