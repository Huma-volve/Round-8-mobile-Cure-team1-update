import 'package:dio/dio.dart';

class ApiServices {
  static String basURL = "https://round8-backend-team-one.huma-volve.com/api/";
  final Dio _dio;
  const ApiServices(this._dio);
  get(endpoint,[Map<String, dynamic>? headers]) async {

    Response respons = await _dio.get('$basURL$endpoint',options: Options(
      headers: headers
    ),);
    return respons.data;
  }
}
