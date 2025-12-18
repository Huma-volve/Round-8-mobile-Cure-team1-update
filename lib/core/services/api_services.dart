import 'package:dio/dio.dart';

class ApiServices {
  static String basURL = "https://round8-backend-team-one.huma-volve.com/api/";
  final Dio _dio;
  const ApiServices(this._dio);
  get(endpoint, token) async {
    Response respons = await _dio.get('$basURL$endpoint',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    return respons.data;
  }

  post(endpoint, Map data) async {
    Response respons = await _dio.post('$basURL$endpoint', data: data);
    return respons.data;
  }

  delet(endpoint, Map data) async {
    Response respons = await _dio.delete('$basURL$endpoint', data: data);
    return respons.data;
  }
}
