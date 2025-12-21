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
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      if (respons is String) {
        return Serverfailuer(respons);
      }
      return Serverfailuer(respons['error']['message']);
    } else if (statusCode == 404) {
      return Serverfailuer('Your request not found,plase try later!');
    } else if (statusCode == 500) {
      return Serverfailuer('Internal Server error,plase try later!');
    } else {
      return Serverfailuer('Opps There was an Error,plase try again!');
    }
  }
}
