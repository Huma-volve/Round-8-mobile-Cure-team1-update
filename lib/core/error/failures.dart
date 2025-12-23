import 'package:dio/dio.dart';

abstract class Failuer {
  final String errormessage;
  const Failuer(this.errormessage);
}

class Serverfailuer extends Failuer {
  Serverfailuer(super.errormassage);
  factory Serverfailuer.forDioExcption(DioException dioexcption) {
    switch (dioexcption.type) {
      case DioExceptionType.connectionTimeout:
        return Serverfailuer('Connection Timeout');
      case DioExceptionType.sendTimeout:
        return Serverfailuer('Send Timeout');
      case DioExceptionType.receiveTimeout:
        return Serverfailuer('Receive Timeout');
      case DioExceptionType.badCertificate:
        return Serverfailuer('Bad Certificate');
      case DioExceptionType.badResponse:
        return Serverfailuer.badRespons(
            dioexcption.response?.statusCode ?? 0, dioexcption.response?.data);
      case DioExceptionType.cancel:
        return Serverfailuer('Request to ApiServer was Canceld');
      case DioExceptionType.connectionError:
        return Serverfailuer('No Internet connection');
      case DioExceptionType.unknown:
        return Serverfailuer('Unexpected Error,please try again!');
    }
  }
  factory Serverfailuer.badRespons(int statusCode, dynamic respons) {
    final message = _extractMessage(respons);
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return Serverfailuer(message ?? 'Request failed,plase try again!');
    } else if (statusCode == 404) {
      return Serverfailuer('Your request not found,plase try later!');
    } else if (statusCode == 500) {
      return Serverfailuer('Internal Server error,plase try later!');
    } else {
      return Serverfailuer(message ?? 'Opps There was an Error,plase try again!');
    }
  }

  static String? _extractMessage(dynamic respons) {
    if (respons == null) {
      return null;
    }
    if (respons is String) {
      return respons;
    }
    if (respons is Map) {
      final error = respons['error'];
      if (error is String && error.isNotEmpty) {
        return error;
      }
      if (error is Map && error['message'] is String) {
        return error['message'] as String;
      }
      final message = respons['message'];
      if (message is String && message.isNotEmpty) {
        return message;
      }
      final errors = respons['errors'];
      if (errors is Map && errors.isNotEmpty) {
        final first = errors.values.first;
        if (first is List && first.isNotEmpty) {
          return first.first.toString();
        }
        return first.toString();
      }
    }
    return null;
  }
}
