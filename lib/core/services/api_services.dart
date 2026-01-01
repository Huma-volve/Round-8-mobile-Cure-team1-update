import 'package:dio/dio.dart';

class ApiServices {
  static String basURL = "https://round8-backend-team-one.huma-volve.com/api/";
  final Dio _dio;
  const ApiServices(this._dio);
  get(endpoint) async {
    Response respons = await _dio.get(
      '$basURL$endpoint ',
      options: Options(

        headers: {

          'Authorization': 'Bearer 262|Yc7tFty5QIDdRCA1n96Qpgk86jB15uXi5m4WUk80f8d9c075',

          'Accept': 'application/json',

        },

      ),
    );
    print(respons.data);
    return respons.data;
  }

  post(endpoint, Map data) async {
    Response respons = await _dio.post('$endpoint', data: data);
    return respons.data;
  }

  postForLogout(
    endpoint,
  ) async {
    Response respons = await _dio.post(
      'https://round8-backend-team-one.huma-volve.com/api/profile/logout',
    );
    return respons.data;
  }

  put(
    endpoint,
    Map data,
  ) async {
    Response response = await _dio.put(
      '$endpoint',
      data: data,
    );
    return response.data;
  }

  delete(endpoint) async {
    Response respons = await _dio.delete('$basURL$endpoint');
    return respons.data;
  }

  delet(endpoint, Map data) async {
    Response respons = await _dio.delete('$basURL$endpoint', data: data);
    return respons.data;
  }
}
