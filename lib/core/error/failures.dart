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
            dioexcption.response!.statusCode!, dioexcption.response!.data!);
      case DioExceptionType.cancel:
        return Serverfailuer('Request to ApiServer was Canceld');
      case DioExceptionType.connectionError:
        return Serverfailuer('No Internet connection');
      case DioExceptionType.unknown:
        return Serverfailuer('Unexpected Error,please try again!');
    }
  }
  factory Serverfailuer.badRespons(int statusCode, dynamic respons) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 422) {
      if (respons is String) {
        return Serverfailuer(respons);
      }
      if (respons is Map) {
        if (respons.containsKey('message')) {
          return Serverfailuer(respons['message']);
        }
        if (respons.containsKey('error') &&
            respons['error'] is Map &&
            respons['error'].containsKey('message')) {
          return Serverfailuer(respons['error']['message']);
        }
      }
      return Serverfailuer('Opps There was an Error,please try again!');
    } else if (statusCode == 404) {
      return Serverfailuer('Your request not found,please try later!');
    } else if (statusCode == 500) {
      return Serverfailuer('Internal Server error,please try later!');
    } else {
      return Serverfailuer('Opps There was an Error,please try again!');
    }
  }
}
